/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:civic_server/src/generated/future/media_cleanup_params.dart'
    as _i2;
import 'package:civic_server/src/generated/post/post.dart' as _i3;
import 'package:civic_server/src/generated/project/project.dart' as _i4;
import 'dart:async' as _i5;
import '../future_calls/media_cleanup_future_call.dart' as _i6;
import '../future_calls/post_future_call.dart' as _i7;
import '../future_calls/project_future_call.dart' as _i8;

/// Invokes a future call.
typedef _InvokeFutureCall =
    Future<void> Function(String name, _i1.SerializableModel? object);

extension ServerpodFutureCallsGetter on _i1.Serverpod {
  /// Generated future calls.
  FutureCalls get futureCalls => FutureCalls();
}

class FutureCalls extends _i1.FutureCallDispatch<_FutureCallRef> {
  FutureCalls._();

  factory FutureCalls() {
    return _instance;
  }

  static final FutureCalls _instance = FutureCalls._();

  _i1.FutureCallManager? _futureCallManager;

  String? _serverId;

  String get _effectiveServerId {
    if (_serverId == null) {
      throw StateError('FutureCalls is not initialized.');
    }
    return _serverId!;
  }

  _i1.FutureCallManager get _effectiveFutureCallManager {
    if (_futureCallManager == null) {
      throw StateError('FutureCalls is not initialized.');
    }
    return _futureCallManager!;
  }

  @override
  void initialize(
    _i1.FutureCallManager futureCallManager,
    String serverId,
  ) {
    var registeredFutureCalls = <String, _i1.FutureCall>{
      'MediaCleanupCleanUpMediaFutureCall':
          MediaCleanupCleanUpMediaFutureCall(),
      'SchedulePostSendPostInFutureFutureCall':
          SchedulePostSendPostInFutureFutureCall(),
      'ScheduleProjectSendProjectInFutureFutureCall':
          ScheduleProjectSendProjectInFutureFutureCall(),
    };
    _futureCallManager = futureCallManager;
    _serverId = serverId;
    for (final entry in registeredFutureCalls.entries) {
      _futureCallManager?.registerFutureCall(entry.value, entry.key);
    }
  }

  @override
  _FutureCallRef callAtTime(
    DateTime time, {
    String? identifier,
  }) {
    return _FutureCallRef(
      (name, object) {
        return _effectiveFutureCallManager.scheduleFutureCall(
          name,
          object,
          time,
          _effectiveServerId,
          identifier,
        );
      },
    );
  }

  @override
  _FutureCallRef callWithDelay(
    Duration delay, {
    String? identifier,
  }) {
    return _FutureCallRef(
      (name, object) {
        return _effectiveFutureCallManager.scheduleFutureCall(
          name,
          object,
          DateTime.now().toUtc().add(delay),
          _effectiveServerId,
          identifier,
        );
      },
    );
  }

  @override
  Future<void> cancel(String identifier) async {
    await _effectiveFutureCallManager.cancelFutureCall(identifier);
  }
}

class _FutureCallRef {
  _FutureCallRef(this._invokeFutureCall);

  final _InvokeFutureCall _invokeFutureCall;

  late final mediaCleanup = _MediaCleanupFutureCallDispatcher(
    _invokeFutureCall,
  );

  late final schedulePost = _SchedulePostFutureCallDispatcher(
    _invokeFutureCall,
  );

  late final scheduleProject = _ScheduleProjectFutureCallDispatcher(
    _invokeFutureCall,
  );
}

class _MediaCleanupFutureCallDispatcher {
  _MediaCleanupFutureCallDispatcher(this._invokeFutureCall);

  final _InvokeFutureCall _invokeFutureCall;

  Future<void> cleanUpMedia(_i2.MediaCleanupParams? object) {
    return _invokeFutureCall(
      'MediaCleanupCleanUpMediaFutureCall',
      object,
    );
  }
}

class _SchedulePostFutureCallDispatcher {
  _SchedulePostFutureCallDispatcher(this._invokeFutureCall);

  final _InvokeFutureCall _invokeFutureCall;

  Future<void> sendPostInFuture(_i3.Post? object) {
    return _invokeFutureCall(
      'SchedulePostSendPostInFutureFutureCall',
      object,
    );
  }
}

class _ScheduleProjectFutureCallDispatcher {
  _ScheduleProjectFutureCallDispatcher(this._invokeFutureCall);

  final _InvokeFutureCall _invokeFutureCall;

  Future<void> sendProjectInFuture(_i4.Project? object) {
    return _invokeFutureCall(
      'ScheduleProjectSendProjectInFutureFutureCall',
      object,
    );
  }
}

class MediaCleanupCleanUpMediaFutureCall
    extends _i1.FutureCall<_i2.MediaCleanupParams> {
  @override
  _i5.Future<void> invoke(
    _i1.Session session,
    _i2.MediaCleanupParams? object,
  ) async {
    await _i6.MediaCleanupFutureCall().cleanUpMedia(
      session,
      object,
    );
  }
}

class SchedulePostSendPostInFutureFutureCall extends _i1.FutureCall<_i3.Post> {
  @override
  _i5.Future<void> invoke(
    _i1.Session session,
    _i3.Post? object,
  ) async {
    await _i7.SchedulePostFutureCall().sendPostInFuture(
      session,
      object,
    );
  }
}

class ScheduleProjectSendProjectInFutureFutureCall
    extends _i1.FutureCall<_i4.Project> {
  @override
  _i5.Future<void> invoke(
    _i1.Session session,
    _i4.Project? object,
  ) async {
    await _i8.ScheduleProjectFutureCall().sendProjectInFuture(
      session,
      object,
    );
  }
}
