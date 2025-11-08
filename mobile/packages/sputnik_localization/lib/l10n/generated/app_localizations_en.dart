// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

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
  String get invalidPassword =>
      'The password must contain no less than 6 and no more than 64 characters';

  @override
  String get passwordDontMatch => 'The passwords don\'t match';

  @override
  String get unknownSignUpError => 'Unknown error when creating an account';

  @override
  String get unknownSignInError =>
      'Unknown error when logging in to the account';

  @override
  String get unknownAuthState =>
      'Oops, I think there\'s been a mistake. You shouldn\'t be here';

  @override
  String get notAuthorizedOnProfile => 'You are not authorized';

  @override
  String get guest => 'Guest';

  @override
  String get profile => 'Profile';

  @override
  String get logout => 'Logout';

  @override
  String get recordTrain => 'Tracking';

  @override
  String get workouts => 'Workouts';

  @override
  String get workoutListLoading => 'Workout list loading...';

  @override
  String get noWorkouts => 'You have no recorded workouts';

  @override
  String get workoutListError => 'Error loading workouts';

  @override
  String get retry => 'Retry';

  @override
  String get progress => 'Progress';

  @override
  String get noWorkoutsThisWeek => 'No workouts this week';

  @override
  String get mon => 'Mon';

  @override
  String get tue => 'Tue';

  @override
  String get wed => 'Wed';

  @override
  String get thu => 'Thu';

  @override
  String get fri => 'Fri';

  @override
  String get sat => 'Sat';

  @override
  String get sun => 'Sun';

  @override
  String get distancePastWeek => 'Distance (km) - Past Week';
}
