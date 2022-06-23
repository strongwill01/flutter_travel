import 'dart:io';

import 'package:flutter/foundation.dart';

///
/// 是否是桌面端
///
bool isDesktop() {
  return Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  // || Platform.isFuchsia;
}

///
/// 是否是移动端
///
bool isMobile() {
  return Platform.isAndroid || Platform.isIOS;
}

///
/// 是否是web端
///
bool isWeb() {
  return kIsWeb;
}
