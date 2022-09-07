import 'package:fitpage_project/criteria_page.dart';
import 'package:fitpage_project/logic/stock_logic/cubit/get_stock_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<GetStockDataCubit>(context).getStockData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<GetStockDataCubit, GetStockDataState>(
          builder: (context, state) {
            if (state is GetStockDataFailure) {
              return const Center(
                child: Text('Failed to Load Data'),
              );
            } else if (state is GetStockDataSuccess) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  final data = state.data[index];
                  return ListTile(
                    title: Text(data.name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CriteriaPage(data: data),
                        ),
                      );
                    },
                    subtitle: Text(
                      data.tag,
                      style: TextStyle(
                        color:
                            data.color == 'green' ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: state.data.length,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
