# sputnik_cardio - Трекинг бега, вело, ходьбы и др

Приложение создано для спорстменов, увелкающихся активными видами спорта. В первую очередь
приложение направлено на бегунов и велосипедистов, оно позволяет подсчитывать
средний темп, время тренироки, расстояние и другие показатели.

## Getting Started
1. Перед настройкой firebase запросить доступ на добавление к проекту firebase
2. Установить Firebase CLI для генерации firebase_options.dart
   https://firebase.google.com/docs/flutter/setup?platform=android&hl=ru#install-cli-tools
3. Настроить приложение для использования Firebase
для работы с firebase потребуется node.js и npm
далее авторизоваться с помощью firebase login
после этого dart pub global activate flutterfire_cli
в терминале в папке проекта написать: flutterfire configure
ВАЖНО: добавить в path путь к Flutterfire CLI
4. В sputnik_workout_core запустить flutter pub get
5. Проверить, что java установлена
собрать проект
если возникают ошибки при сборке, установить java, версия: 17
6. Запросить ключи у создателя проекта
7. Добавить ключи в конфигурацию запуска приложения: Additional run args
8. Запустить проект
Версия flutter:  3.35.4
Запуск проекта можно по кнопке в android studio, конфигурация main.dart



