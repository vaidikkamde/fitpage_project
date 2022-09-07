import 'package:fitpage_project/data/models/stock_model/variable_model.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class VariablePage extends StatelessWidget {
  const VariablePage({Key? key, required this.variableData}) : super(key: key);
  final VariableModel variableData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: variableData.type == 'value'
          ? ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(variableData.values[index].toString()),
                );
              },
              itemCount: variableData.values.length,
            )
          : Container(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Row(
                children: [
                  Text(variableData.parameterName.sentenceCase),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: variableData.defaultValue.toString(),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
