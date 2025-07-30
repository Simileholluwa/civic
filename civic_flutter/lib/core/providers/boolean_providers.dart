import 'package:flutter_riverpod/flutter_riverpod.dart';

class BooleanNotifier extends StateNotifier<bool> {
  BooleanNotifier([bool? show]) : super(show ?? false);

  void setValue(bool value) {
    state = value;
  }
}

final checkEmailLoadingProvider = StateNotifierProvider<BooleanNotifier, bool>(
  (ref) => BooleanNotifier(),
);

final showBottomNav = StateNotifierProvider<BooleanNotifier, bool>(
  (ref) => BooleanNotifier(),
);

final initiatePasswordResetLoadingProvider =
    StateNotifierProvider<BooleanNotifier, bool>(
  (ref) => BooleanNotifier(),
);

final initiateResendPasswordResetLoadingProvider =
    StateNotifierProvider<BooleanNotifier, bool>(
  (ref) => BooleanNotifier(),
);

final createAccountLoadingProvider =
    StateNotifierProvider<BooleanNotifier, bool>(
  (ref) => BooleanNotifier(),
);

final signInLoadingProvider = StateNotifierProvider<BooleanNotifier, bool>(
  (ref) => BooleanNotifier(),
);

final resetPasswordLoadingProvider =
    StateNotifierProvider<BooleanNotifier, bool>(
  (ref) => BooleanNotifier(),
);

final searchNinLoadingProvider = StateNotifierProvider<BooleanNotifier, bool>(
  (ref) => BooleanNotifier(),
);

final validatCreateAccountLoadingProvider =
    StateNotifierProvider<BooleanNotifier, bool>(
  (ref) => BooleanNotifier(),
);

final acceptTermsProvider = StateNotifierProvider<BooleanNotifier, bool>(
  (ref) => BooleanNotifier(),
);

final showPasswordProvider = StateNotifierProvider<BooleanNotifier, bool>(
  (ref) => BooleanNotifier(),
);

final verifiedUserProvider = StateNotifierProvider<BooleanNotifier, bool>(
  (ref) => BooleanNotifier(),
);

final showGalleryProvider = StateNotifierProvider<BooleanNotifier, bool>(
  (ref) => BooleanNotifier(),
);

final sendPostLoadingProvider = StateNotifierProvider<BooleanNotifier, bool>(
  (ref) => BooleanNotifier(),
);
