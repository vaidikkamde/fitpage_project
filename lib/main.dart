import 'package:fitpage_project/data/models/stock_model/stock_model.dart';
import 'package:fitpage_project/home_page.dart';
import 'package:fitpage_project/logic/debug/app_bloc_observer.dart';
import 'package:fitpage_project/logic/stock_logic/cubit/get_stock_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetStockDataCubit>(
          create: (_) => GetStockDataCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
