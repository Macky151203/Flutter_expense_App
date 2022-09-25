import 'package:flutter/material.dart';
import '../widgets/transaction_list.dart';
import 'package:intl/intl.dart';
// import './user_transaction.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({ Key? key }) : super(key: key);

  final Function addtx;
  NewTransaction(this.addtx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();
  final amtcontroller = TextEditingController();
  DateTime? selectdate;
  void presentdatepicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now()).then((pickedate){
          if(pickedate==null){
            return;
          }
          setState(() {
            selectdate=pickedate;
          });
          
        });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titlecontroller,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amtcontroller,
              keyboardType: TextInputType.number,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(5),
                      child: Text(selectdate==null?"No date chosen yet!": DateFormat.yMd().format(selectdate!))),
                  ElevatedButton(
                      onPressed: presentdatepicker, child: Text("Choose date"))
                ],
              ),
            ),
            ElevatedButton(
              child: Text('Add transaction'),
              onPressed: () {
                widget.addtx(
                    titlecontroller.text, double.parse(amtcontroller.text), selectdate);
              },
            )
          ],
        ),
      ),
    );
  }
}
