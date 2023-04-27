import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoneyConv',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'MoneyConv'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final TextEditingController _textFieldController = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  String _opcao = '';
  double _var1 = 1.0;

  void _incrementCounter() {
    setState(() {
      final String text = _textFieldController.text;
      final double value = double.tryParse(text) ?? 0.0;
      final double result = value * _var1;
          'O valor é: ${result.toStringAsFixed(2)}';
      showDialog(
        context: context,
        builder: (BuildContext context) {
          final String text = _textFieldController.text;
          final double value = double.tryParse(text) ?? 0.0;
          final double result = value * _var1;
          final String message =
              'O valor é: ${result.toStringAsFixed(2)}';
          return AlertDialog(
            title: const Text('Conversão'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok!'),
              ),
            ],
          );
        },
      );
    });
  }

  void _selecionaDolar() {
    setState(() {
      _opcao = 'Conversão Dolar';
      _var1 = 5.05;
    });
  }

  void _selecionaEuro() {
    setState(() {
      _opcao = 'Conversão Euro';
      _var1 = 5.60;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: _selecionaDolar,
              child: const Text('Dólar'),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: _selecionaEuro,
              child: const Text('Euro'),
            ),
            const SizedBox(
              height: 50
              ),
            Text(_opcao),
            TextField(
              autofocus: true,
              controller: _textFieldController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Insira o Valor (Reais)',
              ),
            ),
            const SizedBox(
              height: 40
            ),
            ElevatedButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.calculate),
      ),
          ],
        ),
      ),
    );
  }
}
