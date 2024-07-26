import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/profile/domain/usecases/me_use_case.dart';

class ProfileController {
  ProfileController({required MeUseCase meUseCase}) : _meUseCase = meUseCase;

  final MeUseCase _meUseCase;

  Future<UserRecord?> me() async {
    UserRecord? userRecord;
    final result = await _meUseCase(
      NoParams(),
    );
    result.fold(
      (l) => TToastMessages.errorToast(l.message),
      (r) => userRecord = r,
    );
    return userRecord;
  }
}
