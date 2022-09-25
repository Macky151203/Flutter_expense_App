import 'package:flutter/material.dart';

class bar extends StatelessWidget {
  // const bar({ Key? key }) : super(key: key);
  final String label;
  final double spendingamount;
  final double spendpctoftotal;

  bar(this.label, this.spendingamount, this.spendpctoftotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
            child: FittedBox(
                child: Text('\$${spendingamount.toStringAsFixed(0)}'))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 100,
          width: 15,
          margin: EdgeInsets.all(5),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendpctoftotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
