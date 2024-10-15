# Пример приложения на Flutter

### Приложение для покупки билетов в кинотеатр

Приложение содержит главный экран и возможность из него посмотреть описание фильма

### 0. Установка необходимого ПО

1. Требуется компьютер с ОС MacOS, Windows (только Android)
2. Требуется установить среду разработки [Android Studio](https://developer.android.com/studio?hl=ru) (либо [VSCode](https://code.visualstudio.com/download)) и [Flutter SDK](https://flutter-ko.dev/development/tools/sdk/releases) (версия 3.24.0)  
   Для компьютеров с MacOS установить XCode (для сборки под iOS),  
   Для Windows - Android SDK

Более подробно об этом в [документации](https://docs.flutter.dev/get-started/install),

либо в серии видео

[Установка Flutter SDK + Android Studio + Android Emulator](https://www.youtube.com/watch?v=l-SzzTV60Aw)  
[Установка Flutter SDK + VSCode + Android Emulator + небольшое обучение](https://www.youtube.com/watch?v=SZDF1Y1K1UE)  
[Установка Flutter SDK + Android Studio + iOS Simulator](https://www.youtube.com/watch?v=d9o3j-tZxSw)

Далее в студии нужно клонировать репозиторий с проектом
- например в Android Studio это можно на старте выбрав опцию `Get from Version Control` и указав ссылку на репозиторий
- в `VSCode` через опцию `Git clone`

Подробнее в видео

[Клонировать репозиторий в Android Studio и начало работы](https://www.youtube.com/watch?v=eHrUk_YhrAI)  
[Клонировать репозиторий в VSCode и начало работы](https://www.youtube.com/watch?v=XIm7ofsCEH4)

### 1. Сборка и запуск проекта

1. Выполнить команды из терминала проекта
   `flutter clean` - очистка проекта + доустановка зависимостей `fvm`  
   `flutter pub get` - получение зависимостей (зависимости описываются в файле `pubspec.yaml` в корне проекта)

2. Запустить проект, выбрав симулятор/эмулятор и указав конфигурацию

Подробнее в видео

[Запуск на разных типах устройств](https://www.youtube.com/watch?v=lvq0J1W8OEY)

Приложение готово к работе

### 2. Посмотрите про использование Flutter Dev Tools

[Android Studio Flutter DevTools](https://www.youtube.com/watch?v=b4dCHbINmyk)  
[VSCode Flutter DevTools](https://www.youtube.com/watch?v=b4dCHbINmyk)

### 3. Посмотрите про навигацию
В приложении есть пример навигации (при выборе фильма в карусели открываются подробности фильма)  
[Подробно о навигации](https://www.youtube.com/watch?v=C8Qbk9PQR7M)

### 4. Что еще почитать про flutter
[Документация](https://docs.flutter.dev)  
[Про внутренее устройство и архитектуру Flutter](https://habr.com/ru/companies/ligastavok/articles/548662)  
[Еще про внутренее устройство и архитектуру Flutter](https://habr.com/ru/companies/otus/articles/808235)  
[Каналы платформы (общение Framework с нативной частью)](https://habr.com/ru/articles/666272)  
[Про состояние](https://habr.com/ru/articles/424765)
