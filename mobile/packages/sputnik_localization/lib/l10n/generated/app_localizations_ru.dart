// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

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
  String get invalidPassword =>
      'Пароль должен содержать не менее 6 и не более 64 символов';

  @override
  String get passwordDontMatch => 'Пароли не совпадают';

  @override
  String get unknownSignUpError => 'Неизвестная ошибка при создании аккаунта';

  @override
  String get unknownSignInError => 'Неизвестная ошибка при входе в аккаунт';

  @override
  String get unknownAuthState =>
      'Упс, кажется произошла ошибка. Вас тут быть не должно';

  @override
  String get notAuthorizedOnProfile => 'Вы не зарегистрированы';

  @override
  String get guest => 'Гость';

  @override
  String get profile => 'Профиль';

  @override
  String get logout => 'Выйти из аккаунта';

  @override
  String get recordTrain => 'Запись';

  @override
  String get workouts => 'Тренировки';

  @override
  String get workoutListLoading => 'Загрузка списка тренировок...';

  @override
  String get noWorkouts => 'У вас нет записанных тренировок';

  @override
  String get workoutListError => 'Ошибка загрузки тренировок';

  @override
  String get retry => 'Повторить';

  @override
  String get progress => 'Прогресс';

  @override
  String get noWorkoutsThisWeek => 'Нет тренировок за последнюю неделю';

  @override
  String get mon => 'ПН';

  @override
  String get tue => 'ВТ';

  @override
  String get wed => 'СР';

  @override
  String get thu => 'ЧТ';

  @override
  String get fri => 'ПТ';

  @override
  String get sat => 'СБ';

  @override
  String get sun => 'ВС';

  @override
  String get distancePastWeek => 'Дистанция (км) - Последние 7 дней';
}
