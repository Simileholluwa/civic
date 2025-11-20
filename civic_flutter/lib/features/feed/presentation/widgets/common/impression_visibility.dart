import 'dart:async';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ImpressionVisibilityTracker extends ConsumerStatefulWidget {
  const ImpressionVisibilityTracker({
    required this.postId,
    required this.child,
    this.source = 'feed',
    this.threshold = 0.5,
    this.dwell = const Duration(seconds: 1),
    this.cooldown = const Duration(seconds: 15),
    this.fireOnce = false,
    this.enabled = true,
    super.key,
  });

  /// Unique post identifier (non-null when persisted).
  final int postId;

  /// Where the impression originated (e.g. 'feed', 'detail_related').
  final String source;

  /// Minimum visible fraction (0.0 - 1.0) required to start dwell timer.
  final double threshold;

  /// Required continuous time above threshold before firing.
  final Duration dwell;

  /// Local cooldown (separate from repository cooldown) to avoid immediate re-fires.
  final Duration cooldown;

  /// If true, only a single impression is ever recorded for this widget lifecycle.
  final bool fireOnce;

  /// Allows dynamic disabling without removing the widget.
  final bool enabled;

  /// Child content being observed.
  final Widget child;

  @override
  ConsumerState<ImpressionVisibilityTracker> createState() =>
      _ImpressionVisibilityTrackerState();
}

class _ImpressionVisibilityTrackerState
    extends ConsumerState<ImpressionVisibilityTracker> {
  Timer? _dwellTimer;
  double _lastFraction = 0;
  DateTime? _lastFireAt;
  bool _firedOnce = false;
  bool _dwellPending = false;

  bool get _cooldownActive {
    if (_lastFireAt == null) return false;
    return DateTime.now().difference(_lastFireAt!) < widget.cooldown;
  }

  void _scheduleDwell() {
    _dwellTimer?.cancel();
    _dwellPending = true;
    _dwellTimer = Timer(widget.dwell, _tryFireImpression);
  }

  void _cancelDwell() {
    _dwellTimer?.cancel();
    _dwellPending = false;
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!widget.enabled) return;
    _lastFraction = info.visibleFraction.clamp(0.0, 1.0);
    final above = _lastFraction >= widget.threshold;

    if (above) {
      if (!_dwellPending) {
        _scheduleDwell();
      }
    } else {
      // Drop below threshold cancels dwell attempt.
      if (_dwellPending) {
        _cancelDwell();
      }
    }
  }

  Future<void> _tryFireImpression() async {
    _dwellPending = false;
    if (!mounted) return;
    if (!widget.enabled) return;
    // Re-check conditions.
    if (_lastFraction < widget.threshold) return;
    if (_cooldownActive) return;
    if (widget.fireOnce && _firedOnce) return;

    // Fire impression.
    await ref.read(feedImpressionsProvider.notifier).record(
          widget.postId,
          source: widget.source,
        );
    _lastFireAt = DateTime.now();
    _firedOnce = true;

    if (_lastFraction >= widget.threshold && !widget.fireOnce) {}
  }

  @override
  void dispose() {
    _dwellTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('impression-post-${widget.postId}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: widget.child,
    );
  }
}
