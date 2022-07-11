todo



在开发中，较为常用的是从服务中获取数据后进行解析反序列化，每个语言都有不同方式，通过泛型转换等处理

### 1、create class
首先创建一个`demo_data.dart`文件和它关联的类`demo_teaching_activitys.dart`，内容如下:

> 增加注解: JsonSerializable  
> 增加fromjson方法
> 增加tojson方法
> 

```dart
/// demo_data.dart 
import 'package:json_annotation/json_annotation.dart';
import 'package:module_teacher/demo/demo_teaching_activitys.dart';

part 'demo_data.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class DemoData {
  // 不需要关联的可以删除这个属性和相关类demo_teaching_activitys.dart
  List<DemoTeachingActivitys> list;
  int? pagecount;
  int currentpage;
  int reddot;

  DemoData(this.list, this.pagecount, this.currentpage, this.reddot);

  factory DemoData.fromJson(Map<String, dynamic> json) =>
      _$DemoDataFromJson(json);

  Map<String, dynamic> toJson() => _$DemoDataToJson(this);
}

```

```dart
/// demo_teaching_activitys.dart
import 'package:json_annotation/json_annotation.dart';

part 'demo_teaching_activitys.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class DemoTeachingActivitys {
  final int activityid;
  final String? activityname;

  DemoTeachingActivitys(this.activityid, this.activityname);

  factory DemoTeachingActivitys.fromJson(Map<String, dynamic> json) =>
      _$DemoTeachingActivitysFromJson(json);

  Map<String, dynamic> toJson() => _$DemoTeachingActivitysToJson(this);
}

```

### 2、installing packages
在`pubspec.yaml`中加入配置信息，我们就可以来点魔法，自动生成代码了，目前就手动执行命令，后期会做成一个dart脚本去检测并执行自动生成新的代码(或者替代方案使用`watch`持续监听代码变动后自动更新代码，也就是处理增量重建来响应代码的修改)。主要关注` # this line`行的库。

```
dependencies:
  flutter:
    sdk: flutter

  json_annotation: ^4.5.0 # this line

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
  
  build_runner: ^2.0.0 # this line
  json_serializable: ^6.0.0 # this line
```

### 3、sync packages
当配置好三方库时候，我们把它拉下来～执行命令或者IDE中的快捷方式即可，fluttersdk用一以下命令，dartsdk用`dart pub get`

```
flutter pub get
```

### 4、auto generated code
配置好后，进入到上边创建的源文件所在的库的目录下去执行，比如我放在了`project/lib_data`库下，大概结构如下：

```
$ tree -L 3
├── CHANGELOG.md
├── LICENSE
├── README.md
├── analysis_options.yaml
├── lib
│   ├── demo
│   │   ├── demo.dart
│   │   ├── demo_data.dart
│   │   ├── demo_data.g.dart【自动生成文件】
│   │   ├── demo_teaching_activitys.dart
│   │   ├── demo_teaching_activitys.g.dart【自动生成文件】
│   │   └── network_demo
├── pubspec.lock
├── pubspec.yaml
└── test
    └── module_teacher_test.dart
```
进入到这个目录来执行一条魔法命令`flutter pub run build_runner build`(如果是dart则用`dart run build_runner build`), 等待一会, 看日志成功后，就会生成以上文件对应的`.g.dart`文件了。也贴下自动生成后的文件`demo_data.g.dart`和`demo_teaching_activitys.g.dart`，内容如下：

```dart
/// demo_data.g.dart

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemoData _$DemoDataFromJson(Map<String, dynamic> json) => DemoData(
      (json['list'] as List<dynamic>)
          .map((e) => DemoTeachingActivitys.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['pagecount'] as int?,
      json['currentpage'] as int,
      json['reddot'] as int,
    );

Map<String, dynamic> _$DemoDataToJson(DemoData instance) => <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'pagecount': instance.pagecount,
      'currentpage': instance.currentpage,
      'reddot': instance.reddot,
    };

```

```dart
/// demo_teaching_activitys.g.dart

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_teaching_activitys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemoTeachingActivitys _$DemoTeachingActivitysFromJson(
        Map<String, dynamic> json) =>
    DemoTeachingActivitys(
      json['activityid'] as int,
      json['activityname'] as String?,
    );

Map<String, dynamic> _$DemoTeachingActivitysToJson(
        DemoTeachingActivitys instance) =>
    <String, dynamic>{
      'activityid': instance.activityid,
      'activityname': instance.activityname,
    };

```

以上就是json序列化的应用, 也用到了库的拆分概念。这个可以应用到项目中。从接口获取数据后，通过`T.fromjson(json):<T>`来将数据转换成对象后方便使用。

