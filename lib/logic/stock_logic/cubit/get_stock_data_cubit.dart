import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitpage_project/data/data_provider/stock_data.provider.dart';
import 'package:fitpage_project/data/helpers/api_response.dart';
import 'package:fitpage_project/data/models/stock_model/stock_model.dart';

part 'get_stock_data_state.dart';

final emptyState = stockDataFromJson('[{}]');

class GetStockDataCubit extends Cubit<GetStockDataState> {
  GetStockDataCubit() : super(GetStockDataInitial(data: emptyState));
  StockDataProvider stockDataProvider = StockDataProvider();

  void failure({required int statusCode, required String message}) => emit(
        GetStockDataFailure(
          message: message,
          statusCode: statusCode,
          data: emptyState,
        ),
      );

  void success({required List<StockDataModel> data}) => emit(
        GetStockDataSuccess(
          data: data,
        ),
      );
  void loading() => emit(
        GetStockDataLoading(
          data: emptyState,
        ),
      );

  Future<void> getStockData() async {
    loading();
    final response = await stockDataProvider.getData();
    if (response.statusCode == 200) {
      final res = stockDataFromJson(response.responseBody);
      success(data: res);
    } else {
      if (response.statusCode == 401) {
        failure(statusCode: response.statusCode, message: 'Unauthorized');
      } else {
        final res = APIError.fromJson(response.responseBody);
        failure(
          statusCode: res.error.statusCode,
          message: res.error.message,
        );
      }
    }
  }
}
