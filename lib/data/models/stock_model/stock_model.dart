// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:fitpage_project/data/models/stock_model/criteria_model.dart';

List<StockDataModel> stockDataFromJson(String str) => List<StockDataModel>.from(
      json.decode(str).map<StockDataModel>(
            (x) => StockDataModel.fromMap(x as Map<String, dynamic>),
          ),
    );

String stockDataToJson(List<StockDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StockDataModel extends Equatable {
  final int id;
  final String name;
  final String tag;
  final String color;
  final List<CriteriaModel> criteria;
  const StockDataModel({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  StockDataModel copyWith({
    int? id,
    String? name,
    String? tag,
    String? color,
    List<CriteriaModel>? criteria,
  }) {
    return StockDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      tag: tag ?? this.tag,
      color: color ?? this.color,
      criteria: criteria ?? this.criteria,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'tag': tag,
      'color': color,
      'criteria': criteria.map((x) => x.toMap()).toList(),
    };
  }

  factory StockDataModel.fromMap(Map<String, dynamic> map) {
    return StockDataModel(
      id: map['id'] != null ? map['id'] as int : 0,
      name: map['name'] != null ? map['name'] as String : '',
      tag: map['tag'] != null ? map['tag'] as String : '',
      color: map['color'] != null ? map['color'] as String : '',
      criteria: map['criteria'] != null
          ? List<CriteriaModel>.from(
              (map['criteria'] as List<dynamic>).map<CriteriaModel>(
                (x) => CriteriaModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory StockDataModel.fromJson(String source) =>
      StockDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      tag,
      color,
      criteria,
    ];
  }
}
