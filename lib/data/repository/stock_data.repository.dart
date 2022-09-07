import 'package:fitpage_project/data/helpers/api_response.dart';

abstract class StockDataRepository {
  Future<APIResponse> getData();
}
