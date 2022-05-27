## create, analyze, test, and run an app

```
 flutter create my_app
 cd my_app
 flutter analyze
 flutter test
 flutter run lib/main.dart
```
创建、分析、测试和运行应用程序。

## To view all commands that flutter supports
`$ flutter --help --verbose`  
查看所有flutter支持的命令。

## channel
`$ flutter channel`  
查看发布渠道。切换渠道(`flutter channel <channel-name>`)在该命令之后追加具体渠道名称即可。

## version
`$ flutter --version`  
获取 Flutter SDK 的当前版本，包括其框架、引擎和工具。

## analyze
`$ flutter analyze -d <DEVICE_ID>`  
分析项目的 Dart 源代码。

## config
`$ flutter config --build-dir=<DIRECTORY>`  
配置颤振设置。要删除设置，请将其配置为空字符串。

## install
`$ flutter install -d <DEVICE_ID>`  
在连接的设备上安装 Flutter 应用。

## upgrade
`$ flutter upgrade`  
升级Flutter版本。

## doctor
`$ flutter doctor`  
显示有关已安装工具的信息。

## devices
`$ flutter devices`  
列出所有连接的设备。选取一个使用`flutter devices -d <DEVICE_ID>`

## emulators
`$ flutter emulators`  
列出、启动和创建模拟器。

## format
`$ flutter format <DIRECTORY|DART_FILE>`  
格式化 Flutter 源代码。

## gen-l10n
`$ flutter gen-l10n <DIRECTORY>`
为 Flutter 项目生成本地化。