import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final tittleController = TextEditingController();
  final valueController = TextEditingController();

  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Título da Despesa'),
            controller: tittleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Valor (R\$)'),
            controller: valueController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  child: Text("Nova transação"),
                  onPressed: () {
                    print(tittleController.text);
                    print(valueController.text);
                  }),
            ],
          ),
        ]));
  }
}
