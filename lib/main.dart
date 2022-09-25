import 'package:flutter/material.dart';
import '../widgets/new_transaction.dart';
import '../widgets/chart.dart';
import '../widgets/transaction_list.dart';
import '../models/Transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personel Expenses App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // const MyHomePage({Key? key}) : super(key: key);
  final List<Transaction> usertransaction = [
      


    ];
    List<Transaction> get recentTransactions{
      return usertransaction.where((tx){
        return tx.date.isAfter(
          DateTime.now().subtract(
            const Duration(days: 7),
            ),
            );
      }).toList();
    }

    void addnewtransaction(String txtitle, double txnamt, DateTime userdate) {
      final newtx = Transaction(
        DateTime.now().toString(),
        txtitle,
        txnamt, 
        userdate,
      );

      setState(() {
        usertransaction.add(newtx);
      });
      Navigator.of(context).pop();
    }

    void startaddnewtransaction(BuildContext ctx) {
      showModalBottomSheet(
          context: ctx,
          builder: (_) {
            return NewTransaction(addnewtransaction);
          },);
    }

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[IconButton(onPressed: ()=> startaddnewtransaction(context), icon: Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(recentTransactions),
            TransactionList(usertransaction), 
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => startaddnewtransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
