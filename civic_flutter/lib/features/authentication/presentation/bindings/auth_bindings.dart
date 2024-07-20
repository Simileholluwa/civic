import 'package:civic_flutter/features/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:civic_flutter/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:civic_flutter/features/authentication/domain/repository/auth_repository.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/check_if_new_user_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/fetch_all_usernames_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/logout_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/initiate_password_reset_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/reset_user_password_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/search_user_nin_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/upload_profile_image_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/user_sign_in_use_case.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/create_account_request_usecase.dart';
import 'package:civic_flutter/features/authentication/domain/usecases/validate_create_account_use_case.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:get/get.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(
          () => AuthRemoteDatabaseImpl(
                client: Get.find(),
              ),
          fenix: true)
      ..lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(
          remoteDatabase: Get.find(),
        ),
        fenix: true,
      )
      ..lazyPut(
        () => CreateAccountRequestUseCase(
          authRepository: Get.find(),
        ),
        fenix: true,
      )
      ..lazyPut(
        () => UserSignInUseCase(
          authRepository: Get.find(),
        ),
        fenix: true,
      )
      ..lazyPut(
        () => InitiatePasswordResetUseCase(
          authRepository: Get.find(),
        ),
        fenix: true,
      )
      ..lazyPut(
        () => CheckIfNewUserUseCase(
          authRepository: Get.find(),
        ),
        fenix: true,
      )
      ..lazyPut(
        () => LogoutUseCase(
          authRepository: Get.find(),
        ),
        fenix: true,
      )
      ..lazyPut(
        () => ValidateCreateAccountUseCase(
          authRepository: Get.find(),
        ),
        fenix: true,
      )
      ..lazyPut(
        () => SearchUserNinUseCase(
          authRepository: Get.find(),
        ),
        fenix: true,
      )
      ..lazyPut(
        () => FetchAllUsernamesUseCase(
          authRepository: Get.find(),
        ),
        fenix: true,
      )
      ..lazyPut(
        () => UploadProfileImageUseCase(
          authRepository: Get.find(),
        ),
        fenix: true,
      )
      ..lazyPut(
        () => ResetUserPasswordUseCase(
          authRepository: Get.find(),
        ),
        fenix: true,
      )
      ..lazyPut(
        () => AuthController(
          createAccountRequest: Get.find(),
          signInUseCase: Get.find(),
          resetPasswordUseCase: Get.find(),
          checkIfNewUserUseCase: Get.find(),
          validateCreateAccount: Get.find(),
          logoutUseCase: Get.find(),
          ninUseCase: Get.find(),
          usernamesUseCase: Get.find(),
          profileImageUseCase: Get.find(),
          initiatePasswordReset: Get.find(),
        ),
        fenix: true,
      );
  }
}
