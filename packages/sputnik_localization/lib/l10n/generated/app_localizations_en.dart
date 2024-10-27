import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get alreadyHaveAccount => 'Already have account?';

  @override
  String get signIn => 'Sign in';

  @override
  String get signUp => 'Sign up';

  @override
  String get invalidEmail => 'Incorrect e-mail format';

  @override
  String get invalidPassword => 'The password must contain no less than 6 and no more than 64 characters';

  @override
  String get passwordDontMatch => 'The passwords don\'t match';

  @override
  String get unknownSignUpError => 'Unknown error when creating an account';

  @override
  String get unknownSignInError => 'Unknown error when logging in to the account';
}
