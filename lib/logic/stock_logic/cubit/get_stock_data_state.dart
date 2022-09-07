part of 'get_stock_data_cubit.dart';

abstract class GetStockDataState extends Equatable {
  const GetStockDataState({
    required this.loading,
    required this.message,
    required this.statusCode,
    required this.data,
  });
  final bool loading;
  final String message;
  final int statusCode;
  final List<StockDataModel> data;
  @override
  List<Object> get props => [
        loading,
        message,
        statusCode,
        data,
      ];
}

class GetStockDataInitial extends GetStockDataState {
  const GetStockDataInitial({required List<StockDataModel> data})
      : super(
          loading: false,
          message: '',
          statusCode: 0,
          data: data,
        );
}

class GetStockDataLoading extends GetStockDataState {
  const GetStockDataLoading({required List<StockDataModel> data})
      : super(loading: true, message: '', statusCode: 0, data: data);
}

class GetStockDataSuccess extends GetStockDataState {
  const GetStockDataSuccess({required List<StockDataModel> data})
      : super(
          loading: false,
          message: '',
          statusCode: 200,
          data: data,
        );
}

class GetStockDataFailure extends GetStockDataState {
  const GetStockDataFailure({
    required String message,
    required int statusCode,
    required List<StockDataModel> data,
  }) : super(
          loading: false,
          message: message,
          statusCode: statusCode,
          data: data,
        );
}
