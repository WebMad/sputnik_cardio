import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get helloWorld => 'Привет мир!';

  @override
  String get alreadyHaveAccount => 'Уже есть аккаунт?';

  @override
  String get signIn => 'Войти';

  @override
  String get signUp => 'Создать аккаунт';

  @override
  String get invalidEmail => 'Неправильный формат электронной почты';

  @override
  String get invalidPassword => 'Пароль должен содержать не менее 6 и не более 64 символов';

  @override
  String get passwordDontMatch => 'Пароли не совпадают';

  @override
  String get unknownSignUpError => 'Неизвестная ошибка при создании аккаунта';

  @override
  String get unknownSignInError => 'Неизвестная ошибка при входе в аккаунт';
}
