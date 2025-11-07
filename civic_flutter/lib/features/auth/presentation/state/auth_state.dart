import 'package:civic_client/civic_client.dart';

class AuthState {
  AuthState({
    this.imagePath = '',
    this.email = '',
    this.password = '',
    this.politicalStatus = PoliticalStatus.none,
    this.verificationCode = '',
    this.newPassword = '',
    this.passwordResetCode = '',
    this.newAccountPassword = '',
    this.resetPasswordEmail = '',
    this.acceptTerms = false,
    this.firstName = '',
    this.lastName = '',
    this.middleName = '',
    this.nin = '',
    this.checkEmailLoading = false,
    this.signInLoading = false,
    this.createAccountLoading = false,
    this.validatCreateAccountLoading = false,
    this.initiatePasswordResetLoading = false,
    this.initiateResendPasswordResetLoading = false,
    this.searchNinLoading = false,
    this.resetPasswordLoading = false,
    this.photoUrlLoading = false,
  });

  factory AuthState.empty() => AuthState();
  final String email;
  final String password;
  final PoliticalStatus politicalStatus;
  final String verificationCode;
  final String newPassword;
  final String passwordResetCode;
  final String newAccountPassword;
  final String resetPasswordEmail;
  final bool acceptTerms;
  final String firstName;
  final String lastName;
  final String middleName;
  final String nin;
  final String imagePath;
  final bool checkEmailLoading;
  final bool signInLoading;
  final bool createAccountLoading;
  final bool validatCreateAccountLoading;
  final bool initiatePasswordResetLoading;
  final bool initiateResendPasswordResetLoading;
  final bool searchNinLoading;
  final bool resetPasswordLoading;
  final bool photoUrlLoading;
  // Controllers and form keys are managed in the notifier to reduce rebuilds.

  AuthState copyWith({
    String? email,
    String? password,
    PoliticalStatus? politicalStatus,
    String? verificationCode,
    String? newPassword,
    String? passwordResetCode,
    String? newAccountPassword,
    String? resetPasswordEmail,
    bool? acceptTerms,
    String? firstName,
    String? lastName,
    String? middleName,
    String? nin,
    bool? checkEmailLoading,
    bool? signInLoading,
    bool? createAccountLoading,
    bool? validatCreateAccountLoading,
    bool? initiatePasswordResetLoading,
    bool? initiateResendPasswordResetLoading,
    bool? searchNinLoading,
    bool? resetPasswordLoading,
    String? imagePath,
    bool? photoUrlLoading,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      politicalStatus: politicalStatus ?? this.politicalStatus,
      verificationCode: verificationCode ?? this.verificationCode,
      newPassword: newPassword ?? this.newPassword,
      passwordResetCode: passwordResetCode ?? this.passwordResetCode,
      newAccountPassword: newAccountPassword ?? this.newAccountPassword,
      resetPasswordEmail: resetPasswordEmail ?? this.resetPasswordEmail,
      acceptTerms: acceptTerms ?? this.acceptTerms,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      nin: nin ?? this.nin,
      photoUrlLoading: photoUrlLoading ?? this.photoUrlLoading,
      imagePath: imagePath ?? this.imagePath,
      signInLoading: signInLoading ?? this.signInLoading,
      createAccountLoading: createAccountLoading ?? this.createAccountLoading,
      validatCreateAccountLoading:
          validatCreateAccountLoading ?? this.validatCreateAccountLoading,
      initiatePasswordResetLoading:
          initiatePasswordResetLoading ?? this.initiatePasswordResetLoading,
      initiateResendPasswordResetLoading: initiateResendPasswordResetLoading ??
          this.initiateResendPasswordResetLoading,
      searchNinLoading: searchNinLoading ?? this.searchNinLoading,
      resetPasswordLoading: resetPasswordLoading ?? this.resetPasswordLoading,
      checkEmailLoading: checkEmailLoading ?? this.checkEmailLoading,
    );
  }
}
