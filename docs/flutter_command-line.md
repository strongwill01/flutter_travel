## > create, analyze, test, and run an app

```
 flutter create my_app
 cd my_app
 flutter analyze
 flutter test
 flutter run lib/main.dart
```
创建、分析、测试和运行应用程序。

### run参数

arguments    | description    
---- | ---- 
–debug |  调试版本，这是默认模式
–profile | 	profile版本
–release	 | 发布版本
–target-platform	 | 指定app运行的目标平台，比如android-arm/android-arm64，iOS平台不可用
–target=	 | 主入口，默认值lib/main.dart
–observatory-port	 | 指定observatory端口，默认为0（随机生成可用端口）
–disable-service-auth-codes	 | 关闭observatory服务鉴权
–no-hot	 | 可关闭热重载，默认是开启
–verbose-system-logs | 	包括来自flutter引擎的详细日志记录
–trace-startup	 | 跟踪应用启动/退出，并保存trace到文件
–trace-skia | 	跟踪skia，用于调试GPU线程
–trace-systrace	 | 转为systrace，适用于Android/Fuchsia
–dump-skp-on-shader-compilation	 | 转储触发着色器编译的skp，默认关闭
–enable-software-rendering | 	开启软件渲染，默认采用OpenGL或者Vulkan
–skia-deterministic-rendering | 	确定性采用skia渲染
–start-paused	 | 应用启动后暂停
–local-engine-src-path | 	指定本地引擎源码路径，比如xxx/engine/src
–local-engine	 | 指定本地引擎类型，比如android_profile


## > To view all commands that flutter supports
`$ flutter --help --verbose`  
查看所有flutter支持的命令。

## > channel
`$ flutter channel`  
查看发布渠道。切换渠道(`flutter channel <channel-name>`)在该命令之后追加具体渠道名称即可。

## > version
`$ flutter --version`  
获取 Flutter SDK 的当前版本，包括其框架、引擎和工具。

## > analyze
`$ flutter analyze -d <DEVICE_ID>`  
分析项目的 Dart 源代码。

## > config
`$ flutter config --build-dir=<DIRECTORY>`  
配置Flutter设置。要删除设置，请将其配置为空字符串。

## > install
`$ flutter install -d <DEVICE_ID>`  
在连接的设备上安装 Flutter 应用。

## > upgrade
`$ flutter upgrade`  
升级Flutter版本。

## > doctor
`$ flutter doctor`  
显示(诊断)有关已安装工具的信息。

## > logs
显示Flutter应用运行中的log。

## > clean
`$ flutter clean` 
删除build/和.dart_tool/ 目录。

## > devices
`$ flutter devices`  
列出所有连接的设备。选取一个使用`flutter devices -d <DEVICE_ID>`

## > emulators
`$ flutter emulators`  
列出、启动和创建模拟器。

## > format
`$ flutter format <DIRECTORY|DART_FILE>`  
格式化 Flutter 源代码。

## > trace
开始和停止跟踪正在运行的Flutter应用程序。

## > drive
todo
为当前项目运行Flutter Driver测试。

## > test
todo
为当前项目运行Flutter 单元测试。

## > gen-l10n
`$ flutter gen-l10n <DIRECTORY>`
为 Flutter 项目生成本地化。