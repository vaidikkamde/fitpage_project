import 'dart:convert';

import 'package:equatable/equatable.dart';

class APIResponse implements Equatable {
  APIResponse({
    required this.statusCode,
    required this.responseBody,
  });

  final int statusCode;
  final String responseBody;

  @override
  List<Object?> get props => [statusCode, responseBody];

  @override
  bool? get stringify => true;
}

class APIError implements Equatable {
  ErrorClass error;
  APIError({
    required this.error,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error.toMap(),
    };
  }

  factory APIError.fromMap(Map<String, dynamic> map) {
    return APIError(
      error: ErrorClass.fromMap(
        map['error'] != null
            ? map['error'] as Map<String, dynamic>
            : <String, dynamic>{},
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory APIError.fromJson(String source) =>
      APIError.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [error];

  @override
  bool? get stringify => true;
}

class ErrorClass implements Equatable {
  ErrorClass({
    required this.statusCode,
    required this.error,
    required this.message,
  });
  final int statusCode;
  final String error;
  final String message;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'statusCode': statusCode,
      'error': error,
      'message': message,
    };
  }

  factory ErrorClass.fromMap(Map<String, dynamic> map) {
    return ErrorClass(
      statusCode: map['statusCode'] != null ? map['statusCode'] as int : 500,
      error: map['error'] != null ? map['error'] as String : '',
      message: map['message'] != null ? map['message'] as String : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorClass.fromJson(String source) =>
      ErrorClass.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [statusCode, message, error];

  @override
  bool? get stringify => true;
}
