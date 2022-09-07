import 'package:fitpage_project/data/models/stock_model/stock_model.dart';
import 'package:fitpage_project/variable_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CriteriaPage extends StatelessWidget {
  const CriteriaPage({Key? key, required this.data}) : super(key: key);
  final StockDataModel data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            title: Text(data.name),
            subtitle: Text(
              data.tag,
              style: TextStyle(
                color: data.color == 'green' ? Colors.green : Colors.red,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              itemBuilder: (context, index) {
                final critData = data.criteria[index];
                if (critData.type == 'plain_text') {
                  return Text(critData.text);
                } else if (critData.type == 'variable') {
                  var intialText = critData.text;
                  critData.variable.forEach(
                    (key, value) {
                      if (value.type == 'value') {
                        intialText = intialText.replaceAll(key, '~${key}~');
                      } else if (value.type == 'indicator') {
                        intialText = intialText.replaceAll(key, '~${key}~');
                      }
                    },
                  );
                  var newString = intialText.split('~');
                  print(newString);
                  var list = newString.map(
                    (e) {
                      if (e.contains('\$')) {
                        if (critData.variable[e]?.type == 'indicator') {
                          return TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VariablePage(
                                        variableData: critData.variable[e]!),
                                  ),
                                );
                                print('Terms of ${e}"');
                              },
                            style: TextStyle(
                              color: Colors.blue[900],
                            ),
                            text:
                                '(${critData.variable[e]?.defaultValue.toString()})',
                          );
                        } else if (critData.variable[e]?.type == 'value') {
                          return TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VariablePage(
                                        variableData: critData.variable[e]!),
                                  ),
                                );
                                print('Terms of ${e}"');
                              },
                            style: TextStyle(
                              color: Colors.blue[900],
                            ),
                            text:
                                '(${critData.variable[e]?.values.first.toString()})',
                          );
                        } else {
                          return const TextSpan(text: '');
                        }
                      } else {
                        return TextSpan(text: e);
                      }
                    },
                  ).toList();
                  return RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [...list],
                    ),
                  );
                } else {
                  return Text(critData.text);
                }
              },
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  'and',
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ),
              itemCount: data.criteria.length,
            ),
          )
        ],
      ),
    );
  }
}
