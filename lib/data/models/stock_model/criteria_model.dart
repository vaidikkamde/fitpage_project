// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:fitpage_project/data/models/stock_model/variable_model.dart';

class CriteriaModel extends Equatable {
  final String type;
  final String text;
  final Map<String, VariableModel> variable;
  const CriteriaModel({
    required this.type,
    required this.text,
    required this.variable,
  });

  CriteriaModel copyWith({
    String? type,
    String? text,
    Map<String, VariableModel>? variable,
  }) {
    return CriteriaModel(
      type: type ?? this.type,
      text: text ?? this.text,
      variable: variable ?? this.variable,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'text': text,
      'variable': variable,
    };
  }

  factory CriteriaModel.fromMap(Map<String, dynamic> map) {
    return CriteriaModel(
      type: map['type'] != null ? map['type'] as String : '',
      text: map['text'] != null ? map['text'] as String : '',
      variable: map['variable'] != null
          ? Map<String, dynamic>.from(map['variable']).map(
              (
                key,
                value,
              ) =>
                  MapEntry(
                key,
                VariableModel.fromMap(
                  value,
                ),
              ),
            )
          : {},
    );
  }

  String toJson() => json.encode(toMap());

  factory CriteriaModel.fromJson(String source) =>
      CriteriaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [type, text, variable];
}
