// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

// class VariableModel extends Equatable {
//   final VariableDataModel variableDataModel;
// }

class VariableModel extends Equatable {
  final String type;
  final List<dynamic> values;
  final String studyType;
  final String parameterName;
  final int minValue;
  final int maxValue;
  final int defaultValue;
  const VariableModel({
    required this.type,
    required this.values,
    required this.studyType,
    required this.parameterName,
    required this.minValue,
    required this.maxValue,
    required this.defaultValue,
  });

  VariableModel copyWith({
    String? type,
    List<dynamic>? values,
    String? studyType,
    String? parameterName,
    int? minValue,
    int? maxValue,
    int? defaultValue,
  }) {
    return VariableModel(
      type: type ?? this.type,
      values: values ?? this.values,
      studyType: studyType ?? this.studyType,
      parameterName: parameterName ?? this.parameterName,
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
      defaultValue: defaultValue ?? this.defaultValue,
    );
  }

  Map<String, dynamic> toMap() {
    if (type == 'value') {
      return <String, dynamic>{
        'type': type,
        'values': values,
      };
    } else {
      return <String, dynamic>{
        'type': type,
        'studyType': studyType,
        'parameterName': parameterName,
        'minValue': minValue,
        'maxValue': maxValue,
        'defaultValue': defaultValue,
      };
    }
  }

  factory VariableModel.fromMap(Map<String, dynamic> map) {
    return VariableModel(
      type: map['type'] as String,
      values: map['values'] != null ? List<dynamic>.from((map['values'])) : [],
      studyType: map['study_type'] != null ? map['study_type'] as String : '',
      parameterName:
          map['parameter_name'] != null ? map['parameter_name'] as String : '',
      minValue: map['min_value'] != null ? map['min_value'] as int : 0,
      maxValue: map['max_value'] != null ? map['max_value'] as int : 0,
      defaultValue:
          map['default_value'] != null ? map['default_value'] as int : 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory VariableModel.fromJson(String source) =>
      VariableModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      type,
      values,
      studyType,
      parameterName,
      minValue,
      maxValue,
      defaultValue,
    ];
  }
}
