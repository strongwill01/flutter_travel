> TODO:  需要详细具体分析输出文档

`flutter run`属于`flutter tools`下的一个工具，对应执行的是`Run.runCommand()`，命令执行由4个部分组成：

-  flutter build apk 命令对应 BuildApkCommand
-  flutter build aot 命令对应 BuildAotCommand
-  flutter build bundle 命令对应 BuildBundleCommand
-  flutter install 命令对应 InstallCommand



来看源码，在`/flutter/packages/flutter_tools/lib/src/commands/`目录下的`run.dart`。

```
@override
Future<FlutterCommandResult> runCommand() async {
  	...
}

```

`debug`模式下默认开启`hot reload`；
遍历所有devices并发现已连接的设备；


### flutter build apk
对应`/flutter_tools/lib/src/commands/build_apk.dart`类。
```
  @override
  Future<FlutterCommandResult> runCommand() async {
    if (globals.androidSdk == null) {
      exitWithNoSdkMessage();
    }
    final BuildInfo buildInfo = await getBuildInfo();
    final AndroidBuildInfo androidBuildInfo = AndroidBuildInfo(
      buildInfo,
      splitPerAbi: boolArg('split-per-abi'),
      targetArchs: stringsArg('target-platform').map<AndroidArch>(getAndroidArchForName),
      multidexEnabled: boolArg('multidex'),
    );
    validateBuild(androidBuildInfo);
    displayNullSafetyMode(androidBuildInfo.buildInfo);
    globals.terminal.usesTerminalUi = true;
    await androidBuilder?.buildApk(
      project: FlutterProject.current(),
      target: targetFile,
      androidBuildInfo: androidBuildInfo,
    );
    return FlutterCommandResult.success();
  }
```

### flutter build aot


### flutter build bundle


### flutter install

```

  @override
  Future<FlutterCommandResult> runCommand() async {
    final Device targetDevice = device!;
    final ApplicationPackage? package = await applicationPackages?.getPackageForPlatform(
      await targetDevice.targetPlatform,
    );
    if (package == null) {
      throwToolExit('Could not find or build package');
    }

    if (uninstallOnly) {
      await _uninstallApp(package, targetDevice);
    } else {
      await _installApp(package, targetDevice);
    }
    return FlutterCommandResult.success();
  }

  Future<void> _uninstallApp(ApplicationPackage package, Device device) async {
    if (await device.isAppInstalled(package, userIdentifier: userIdentifier)) {
      globals.printStatus('Uninstalling $package from $device...');
      if (!await device.uninstallApp(package, userIdentifier: userIdentifier)) {
        globals.printError('Uninstalling old version failed');
      }
    } else {
      globals.printStatus('$package not found on $device, skipping uninstall');
    }
  }

  Future<void> _installApp(ApplicationPackage package, Device device) async {
    globals.printStatus('Installing $package to $device...');

    if (!await installApp(device, package, userIdentifier: userIdentifier)) {
      throwToolExit('Install failed');
    }
  }
}

Future<bool> installApp(
  Device device,
  ApplicationPackage package, {
  String? userIdentifier,
  bool uninstall = true
}) async {
  if (package == null) {
    return false;
  }

  try {
    if (uninstall && await device.isAppInstalled(package, userIdentifier: userIdentifier)) {
      globals.printStatus('Uninstalling old version...');
      if (!await device.uninstallApp(package, userIdentifier: userIdentifier)) {
        globals.printWarning('Warning: uninstalling old version failed');
      }
    }
  } on ProcessException catch (e) {
    globals.printError('Error accessing device ${device.id}:\n${e.message}');
  }

  return device.installApp(package, userIdentifier: userIdentifier);
}
```

调用的是`/src/android/android_device.dart`下的方法，就是执行命令`adb install -t -r [app.applicationPackage.path]`
```
  @override
  Future<bool> installApp(
    AndroidApk app, {
    String? userIdentifier,
  }) async {
    if (!await _adbIsValid) {
      return false;
    }
    final bool wasInstalled = await isAppInstalled(app, userIdentifier: userIdentifier);
    if (wasInstalled && await isLatestBuildInstalled(app)) {
      _logger.printTrace('Latest build already installed.');
      return true;
    }
    _logger.printTrace('Installing APK.');
    if (await _installApp(app, userIdentifier: userIdentifier)) {
      return true;
    }
    _logger.printTrace('Warning: Failed to install APK.');
    if (!wasInstalled) {
      return false;
    }
    _logger.printStatus('Uninstalling old version...');
    if (!await uninstallApp(app, userIdentifier: userIdentifier)) {
      _logger.printError('Error: Uninstalling old version failed.');
      return false;
    }
    if (!await _installApp(app, userIdentifier: userIdentifier)) {
      _logger.printError('Error: Failed to install APK again.');
      return false;
    }
    return true;
  }

  Future<bool> _installApp(
    AndroidApk app, {
    String? userIdentifier,
  }) async {
    if (!app.applicationPackage.existsSync()) {
      _logger.printError('"${_fileSystem.path.relative(app.applicationPackage.path)}" does not exist.');
      return false;
    }

    final Status status = _logger.startProgress(
      'Installing ${_fileSystem.path.relative(app.applicationPackage.path)}...',
    );
    final RunResult installResult = await _processUtils.run(
      adbCommandForDevice(<String>[
        'install',
        '-t',
        '-r',
        if (userIdentifier != null)
          ...<String>['--user', userIdentifier],
        app.applicationPackage.path
      ]));
    status.stop();
    // Some versions of adb exit with exit code 0 even on failure :(
    // Parsing the output to check for failures.
    final RegExp failureExp = RegExp(r'^Failure.*$', multiLine: true);
    final String? failure = failureExp.stringMatch(installResult.stdout);
    if (failure != null) {
      _logger.printError('Package install error: $failure');
      return false;
    }
    if (installResult.exitCode != 0) {
      if (installResult.stderr.contains('Bad user number')) {
        _logger.printError('Error: User "$userIdentifier" not found. Run "adb shell pm list users" to see list of available identifiers.');
      } else {
        _logger.printError('Error: ADB exited with exit code ${installResult.exitCode}');
        _logger.printError('$installResult');
      }
      return false;
    }
    try {
      await runAdbCheckedAsync(<String>[
        'shell', 'echo', '-n', _getSourceSha1(app), '>', _getDeviceSha1Path(app),
      ]);
    } on ProcessException catch (error) {
      _logger.printError('adb shell failed to write the SHA hash: $error.');
      return false;
    }
    return true;
  }
```

