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
  final int postId;
  final String source;
  final double threshold;
  final Duration dwell;
  final Duration cooldown;
  final bool fireOnce;
  final bool enabled;
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
  bool _disposed = false;

  bool get _cooldownActive {
    if (_lastFireAt == null) return false;
    return DateTime.now().difference(_lastFireAt!) < widget.cooldown;
  }

  void _scheduleDwell() {
    if (_dwellPending) return;
    _dwellTimer?.cancel();
    _dwellPending = true;
    _dwellTimer = Timer(
      widget.dwell,
      _tryFireImpression,
    );
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
      if (_dwellPending) {
        _cancelDwell();
      }
    }
  }

  Future<void> _tryFireImpression() async {
    _dwellPending = false;
    if (_disposed) return;
    if (!mounted || !widget.enabled) return;
    if (_lastFraction < widget.threshold) return;
    if (_cooldownActive) return;
    if (widget.fireOnce && _firedOnce) return;
    if (widget.postId <= 0) return;
    await ref.read(feedImpressionsProvider.notifier).record(
          widget.postId,
          source: widget.source,
        );
    _lastFireAt = DateTime.now();
    _firedOnce = true;
    if (widget.fireOnce) {
      _cancelDwell();
    }
  }

  @override
  void dispose() {
    _dwellTimer?.cancel();
    _disposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }
    return VisibilityDetector(
      key: Key('impression-post-${widget.postId}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: widget.child,
    );
  }
}
