import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final tittleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = tittleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Título da Despesa'),
            onSubmitted: (title) => _submitForm(),
            controller: tittleController,
          ),
          TextField(
            controller: valueController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (value) => _submitForm(),
            decoration: InputDecoration(labelText: 'Valor (R\$)'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(child: Text("Nova transação"), onPressed: _submitForm),
            ],
          ),
        ],
      ),
    );
  }
}
