import 'dart:convert';

import 'package:fitpage_project/data/helpers/api_response.dart';
import 'package:fitpage_project/data/repository/stock_data.repository.dart';
import 'package:http/http.dart' as http;

class StockDataProvider implements StockDataRepository {
  final String url = 'https://mobile-app-challenge.herokuapp.com/data';
  @override
  Future<APIResponse> getData() async {
    try {
      final response = await http.get(Uri.parse(url));
      return APIResponse(
        statusCode: response.statusCode,
        responseBody: response.body,
      );
    } catch (error) {
      return APIResponse(
        statusCode: 500,
        responseBody: json.encode(
          {
            'error': {
              'statusCode': 500,
              'error': 'App Error',
              'message': 'An App Internal Error As Occured',
            }
          },
        ),
      );
    }
  }
}
