import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

///
/// 应用信息
///  * todo：
///   1、弹窗显示
///   2、增加背景，logo
///
class PkgInfos extends StatefulWidget {
  PkgInfos({Key? key, required this.title}) : super(key: key);

  final String? title;
  @override
  State<PkgInfos> createState() => _PkgInfosState();
}

class _PkgInfosState extends State<PkgInfos> {
  PackageInfo _pkgInfoData = PackageInfo(
      appName: 'appName',
      packageName: 'packageName',
      version: 'version',
      buildNumber: 'buildNumber',
      buildSignature: 'buildSignature');

  @override
  void initState() {
    super.initState();
    _initPkgInfo();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.black,
            ),
            title: Text(
              widget.title!, // todo
            )),
        body: Column(
          children: [
            Center(
              child: Wrap(
                // direction: Axis.vertical,
                // verticalDirection: VerticalDirection.up,
                spacing: 10.0,
                children: [
                  _infoTile('App Name:', _pkgInfoData.appName),
                  _infoTile('Package Name:', _pkgInfoData.packageName),
                  _infoTile('Verion:', _pkgInfoData.version),
                  _infoTile('Build Number:', _pkgInfoData.buildNumber),
                  _infoTile('Build Signature:', _pkgInfoData.buildSignature),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? "No set." : subtitle),
    );
  }

  Future<void> _initPkgInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _pkgInfoData = info;
    });
  }
}

class PkgInfoData {
  PkgInfoData(
      {this.appName,
      this.packageName,
      this.version,
      this.buildNumber,
      this.buildSignature});

  String? appName;
  String? packageName;
  String? version;
  String? buildNumber;
  String? buildSignature;
}
