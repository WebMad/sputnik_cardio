# sputnik_cardio - Трекинг бега, вело, ходьбы и др

Приложение создано для спорстменов, увелкающихся активными видами спорта. В первую очередь
приложение направлено на бегунов и велосипедистов, оно позволяет подсчитывать
средний темп, время тренироки, расстояние и другие показатели.

## Getting Started
1. Добавить flutter_sputnik_di вместо пути, использованным раннее
   https://pub.dev/packages/flutter_sputnik_di
2. Удалить зависимость dependency_overrides: в pubspec.yaml
3. Добавить sputnik_di в зависимости проекта
   https://pub.dev/packages/sputnik_di
4. Установить Firebase CLI для генерации firebase_options.dart
   https://firebase.google.com/docs/flutter/setup?platform=android&hl=ru#install-cli-tools
5. Установить node.js и npm
      https://nodejs.org/
6. Настроить приложение для использования Firebase
далее авторизоваться с помощью firebase login
после этого dart pub global activate flutterfire_cli
в терминале в папке проекта написать: flutterfire configure
ВАЖНО: добавить в path путь к Flutterfire CLI
7. В sputnik_workout_core запустить flutter pub get
8. Установить java, версия: 17
9. Засекретить ключи с помощью env
   https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/#new-in-flutter-37-use---dart-define-from-file
добавить также в зависимости:
   dev_dependencies:
     envied_generator: ^1.1.1
10. добавить ключи в конфигурацию запуска приложения: Additional run args
11. Запустить проект
Версия flutter:  3.35.4
Запуск проекта можно по кнопке в android studio, конфигурация main.dart



