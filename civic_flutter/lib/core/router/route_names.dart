class AppRoutes {
  // Onboarding
  static const initial = '/';
  static const onboarding = '/onboarding';

  // Authentication
  static const auth = '/auth';
  static const validateCreateAccount = 'validateCreateAccount';
  static const checkIfNewUser = 'checkNewUser';
  static const signUp = 'signUp';
  static const chooseUsername = 'chooseUsername';
  static const selectStatus = 'selectStatus';
  static const resetPassword = 'resetPassword';
  static const confirmDetails = 'confirmDetails';
  static const verifyResetPasswordCode = 'verifyCode';
  static const createNewPassword = 'createNewPassword';
  static const verifyNinPhoneOTP = 'Verify_phone_otp';
  static const verifyNinEmailOTP = 'Verify_email_otp';
  static const createAccountRequest = 'createAccountRequest';
  static const verifyAccount = 'verifyAccount';
  static const login = 'login';
  static const profile = '/profile/:userId';
}
