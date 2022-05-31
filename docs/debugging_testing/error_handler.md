> TODO

Flutter 框架可以捕获运行期间的错误，包括构建期间、布局期间和绘制期间。
所有 Flutter 的错误均会被回调方法 FlutterError.onError 捕获。默认情况下，会调用 FlutterError.presentError 方法，并将错误转储到当前的设备日志中。当从 IDE 运行应用时，检查器重写了该方法，错误也被发送到 IDE 的控制台，可以在控制台中检查出错的对象。
