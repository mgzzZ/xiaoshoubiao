abstract class Template {
  final String fileName;
  final String className;
  final Map<String, dynamic> param;

  const Template({
    required this.fileName,
    required this.className,
    required this.param,
  });

  String get output => '';
}

class JsonAnnotationsTemplate implements Template {
  @override
  final String className;

  @override
  final String fileName;

  @override
  final Map<String, dynamic> param;

  JsonAnnotationsTemplate(
      {required this.className, required this.fileName, required this.param});
  String get paramStr {
    StringBuffer stringBuffer = StringBuffer();

    param.forEach((key, value) {
      if (value.runtimeType.toString().contains('Map')) {
        stringBuffer.write('Map<String, dynamic>? $key;\n\n  ');
      } else {
        stringBuffer.write('${value.runtimeType.toString()}? $key;\n\n  ');
      }
    });

    return stringBuffer.toString();
  }

  @override
  String get output => '''
import 'package:json_annotation/json_annotation.dart';

part '$fileName.g.dart';

@JsonSerializable()
class $className {
  $className();

  factory $className.fromJson(Map<String, dynamic> json) => _\$${className}FromJson(json);

  Map<String, dynamic> toJson() => _\$${className}ToJson(this);

  $paramStr
}
''';
}

class NormalTemplate implements Template {
  @override
  final String className;

  @override
  final String fileName;

  @override
  final Map<String, dynamic> param;
  String get paramStr {
    StringBuffer stringBuffer = StringBuffer();

    param.forEach((key, value) {
      if (value.runtimeType.toString().contains('Map')) {
        stringBuffer.write('Map<String, dynamic>? $key;\n\n  ');
      } else {
        stringBuffer.write('${value.runtimeType.toString()}? $key;\n\n  ');
      }
    });

    return stringBuffer.toString();
  }

  NormalTemplate(
      {required this.className, required this.fileName, required this.param});

  @override
  String get output => '''

class $className {
  $className();

  $paramStr
}
''';
}

class FreezedTemplate implements Template {
  @override
  final String className;

  @override
  final String fileName;

  @override
  final Map<String, dynamic> param;
  String get paramStr {
    StringBuffer stringBuffer = StringBuffer();
    param.forEach((key, value) {
      if (value.runtimeType.toString().contains('Map')) {
        stringBuffer.write('Map<String, dynamic>? $key;\n\n  ');
      } else {
        stringBuffer.write('${value.runtimeType.toString()}? $key;\n\n  ');
      }
    });

    return stringBuffer.toString();
  }

  FreezedTemplate(
      {required this.className, required this.fileName, required this.param});

  @override
  String get output => '''
import 'package:freezed_annotation/freezed_annotation.dart';

part '$fileName.freezed.dart';
part '$fileName.g.dart';

@freezed
class $className {
  $className();

  factory $className.fromJson(Map<String, dynamic> json) => _\$${className}FromJson(json);

  $paramStr
}
''';
}
