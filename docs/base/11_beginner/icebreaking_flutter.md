

### 1.install
[window&macOS&Linux install link](https://flutter.io/docs/get-started/install)

### 2. Get the Flutter SDK

* 1.Download the following installation bundle to get the latest beta release of the Flutter SDK:

* 2.Extract the zip file and place the contained flutter in the desired installation location for the Flutter SDK (eg. C:\src\flutter; do not install Flutter in a directory like C:\Program Files\ that requires elevated privileges).

* 3.Locate the file `flutter_console.bat` inside the flutter directory. Start it by double-clicking.

You are now ready to run Flutter commands in the Flutter Console!

To update an existing version of Flutter, see Upgrading Flutter.

[reference link](https://flutter.io/docs/get-started/install/windows)

**command**

**--(1)Check the version**
```
E:\Android\flutter\flutter_windows_v0.11.3-beta\flutter>flutter --version
Flutter 0.11.3 • channel beta • https://github.com/flutter/flutter.git
Framework • revision 72bf075e8d (4 days ago) • 2018-11-09 20:36:17 -0800
Engine • revision 5646e86a6f
Tools • Dart 2.1.0 (build 2.1.0-dev.9.3 9c07fb64c4)

```

**--(2)See the help**

```
E:\Android\flutter\flutter_windows_v0.11.3-beta\flutter>flutter -h
Manage your Flutter app development.

Common commands:

  flutter create <output directory>
    Create a new Flutter project in the specified directory.

  flutter run [options]
    Run your Flutter application on an attached device or in an emulator.

Usage: flutter <command> [arguments]

Global options:
-h, --help                  Print this usage information.
-v, --verbose               Noisy logging, including all shell commands executed.
                            If used with --help, shows hidden options.

-d, --device-id             Target device id or name (prefixes allowed).
    --version               Reports the version of this tool.
    --suppress-analytics    Suppress analytics reporting when this command runs.
    --bug-report            Captures a bug report file to submit to the Flutter team.
                            Contains local paths, device identifiers, and log snippets.

    --packages              Path to your ".packages" file.
                            (required, since the current directory does not contain a ".packages" file)

Available commands:
  analyze                  Analyze the project's Dart code.
  attach                   Attach to a running application.
  bash-completion          Output command line shell completion setup scripts.
  build                    Flutter build commands.
  channel                  List or switch flutter channels.
  clean                    Delete the build/ directory.
  config                   Configure Flutter settings.
  create                   Create a new Flutter project.
  devices                  List all connected devices.
  doctor                   Show information about the installed tooling.
  drive                    Runs Flutter Driver tests for the current project.
  emulators                List, launch and create emulators.
  format                   Format one or more dart files.
  help                     Display help information for flutter.
  install                  Install a Flutter app on an attached device.
  logs                     Show log output for running Flutter apps.
  make-host-app-editable   Moves host apps from generated directories to non-generated directories so that they can be
                           edited by developers.
  packages                 Commands for managing Flutter packages.
  precache                 Populates the Flutter tool's cache of binary artifacts.
  run                      Run your Flutter app on an attached device.
  screenshot               Take a screenshot from a connected device.
  stop                     Stop your Flutter app on an attached device.
  test                     Run Flutter unit tests for the current project.
  trace                    Start and stop tracing for a running Flutter app.
  upgrade                  Upgrade your copy of Flutter.

Run "flutter help <command>" for more information about a command.
Run "flutter help -v" for verbose help output, including less commonly used options.
```

**--(3)Update your path**

If you wish to run Flutter commands in the regular Windows console, take these steps to add Flutter to the `PATH` environment variable:

* If the entry does exist, append the full path to `flutter\bin` using `;` as a separator from existing values

* If the entry does not exist, create a new user variable named Path with the full path to flutter\bin as its value


### 3.Install Android SDK 

...

### 4.Install Android Studio

...

### 5.Set up your Android device

To prepare to run and test your Flutter app on an Android device, you’ll need an Android device running Android 4.1 (API level 16) or higher

In the terminal, run the `flutter devices` command to verify that Flutter recognizes your connected Android device.

```
E:\Android\flutter\flutter_windows_v0.11.3-beta\flutter>flutter devices
1 connected device:

MI 4W • a211a750 • android-arm • Android 6.0.1 (API 23)

```

### 6.Set up the Android emulator

...

### 7.Install the Flutter and Dart plugins

To install these:

* 1.Start Android Studio.
* 2.Open plugin preferences `(Preferences > Plugins on macOS, File > Settings > Plugins on Windows & Linux)`.
* 3.Select `Browse repositories`, select the `Flutter plugin` and click Install.
* 4.Click `Yes` when prompted to install the Dart plugin.
* 5.Click `Restart` when prompted.

### 8.create project

Take Flutter for a test drive: create a first project, run it, and experience “hot reload”.