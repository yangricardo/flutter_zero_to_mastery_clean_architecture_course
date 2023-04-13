# Dart & Flutter - Zero to Mastery [2023] + Clean Architecture

UDEMY: <https://www.udemy.com/course/flutter-made-easy-zero-to-mastery>

## VSCode Extensions

Name: Flutter
Id: Dart-Code.flutter
Description: Flutter support and debugger for Visual Studio Code.
Version: 3.62.0
Publisher: Dart Code
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter

Name: Dart
Id: Dart-Code.dart-code
Description: Dart language support and debugger for Visual Studio Code.
Version: 3.62.0
Publisher: Dart Code
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code

Name: Better Comments
Id: aaron-bond.better-comments
Description: Improve your code commenting by annotating with alert, informational, TODOs, and more!
Version: 3.0.2
Publisher: Aaron Bond
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments

Name: Todo Tree
Id: Gruntfuggly.todo-tree
Description: Show TODO, FIXME, etc. comment tags in a tree view
Version: 0.0.225
Publisher: Gruntfuggly
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree

Name: Error Lens
Id: usernamehw.errorlens
Description: Improve highlighting of errors, warnings and other language diagnostics.
Version: 3.9.0
Publisher: Alexander
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens

Name: bloc
Id: FelixAngelov.bloc
Description: Support for the bloc library and provides tools for effectively creating blocs for both Flutter and AngularDart apps.
Version: 6.6.3
Publisher: Felix Angelov
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc

## Github Course Repo

<https://github.com/OpenSphereSoftware/FlutterMadeEasy_ZeroToMastery>

- Dart Basics: https://github.dev/OpenSphereSoftware/FlutterMadeEasy_ZeroToMastery/tree/main/1_dart

## ADB Cli Configuration

Update Path variable for your profile terminal, (eg: zsh)

```bash
export PATH="$PATH:$HOME/flutter/bin/"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export PATH="$PATH:$HOME/Library/Android/sdk/cmdline-tools/latest/bin"
export PATH="$PATH:$HOME/Library/Android/sdk/tools"
```

## Debug app with ADB via wifi

> adb connect $IP:$PORT
> https://medium.com/android-news/wireless-debugging-through-adb-in-android-using-wifi-965f7edd163a

## Flutter Cheat Sheet

The most important Flutter Commands are listed here with a brief description of them. You can either execute Flutter Commands in the terminal on your computer or in the terminal in VS Code. If the commands are to do something with your project, it helps to be in the project folder.

Flutter Help:

> flutter -h

Shows you all commands with a description again in the terminal.

Flutter Version:

> flutter --version

Shows you your installed Flutter version.

Flutter Channel:

> flutter channel

Shows you in which channel (branch) you are - default is channel stable. If you want to try new features you can also switch to the beta channel.

Flutter Doctor:

> flutter doctor

Gives you the information about your development environment.

Flutter Upgrade:

> flutter upgrade

This will update to the latest Flutter version.

Flutter Downgrade:

> flutter downgrade <version> (example: $ flutter downgrade v2.3.2)

This allows you to downgrade to a specific version.

Neues Projekt erstellen:

> flutter create <app name> (example: $ flutter create "myapp")

Create a new flutter project with the standard counter app.

Flutter Emulator:

> flutter emulator

Listet dir alle verfügbaren devices.

Flutter Emulator launch:

> flutter emulator --launch <emulator_name> (example $ flutter emulator --launch myPixel)

Starts a specific emulator (Virtual device).

Flutter Run:

> flutter run

Starts your app on a virtual device (if available & started) in debug mode.

Flutter Release:

> flutter run --release

Starts your app on a virtual device (if available & started) in release mode. So install a whole APK on the phone.

Flutter Clean:

> flutter clean

Removes the files created during the build from the project (cleans up). Can sometimes help with weird behavior. However, you often have to re-enter afterwards $ flutter pub get

Flutter pub get:

> flutter pub get

Downloads the dependencies in the project.

Commands für den Debug Modus:

These commands will help you if you have started the app from VS Code in debug mode (flutter run) with the terminal.

Big R: Restart the app on the emulator with the code changes.

Small r: Hot reload: Loads code changes live.

Q: Close the app (quit). Stops debugging.
