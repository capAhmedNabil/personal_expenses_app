import 'package:flutter/material.dart';

import './widets/new_transaction.dart';
import './widets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
      ),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 'T1',
      title: 'shirt',
      amount: 300.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 'T2',
      title: 'Weekly Groceries',
      amount: 150,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransacion(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expesnes'),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransacion(context),
            icon: const Icon(
              Icons.library_add,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Chart'),
              ),
            ),
            TransationList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () => _startAddNewTransacion(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
