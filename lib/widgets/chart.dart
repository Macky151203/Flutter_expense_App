import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:personel_expense/widgets/bar.dart';
import '../models/Transaction.dart';

class Chart extends StatelessWidget {
  // const Chart({ Key? key }) : super(key: key);

  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedtransactionsvalues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalsum = 0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekday.day &&
            recentTransactions[i].date.month == weekday.month &&
            recentTransactions[i].date.year == weekday.year) {
          totalsum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekday));
      print(totalsum);

      return {'day': DateFormat.E().format(weekday).substring(0,1), 'amount': totalsum};
    }).reversed.toList();
  }

  double get totalspending {
    return groupedtransactionsvalues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }
 
  @override
  Widget build(BuildContext context) {
    final widgetlist = groupedtransactionsvalues.map((data) {
      return bar((data['day'] as String), (data['amount'] as double), totalspending==0? 0.0 :
          (data['amount'] as double) / totalspending);
    }).toList();
    print(groupedtransactionsvalues);
    return Card(
      
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widgetlist,
        ),
      ),
    );
  }
}
