import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransationList extends StatelessWidget {
  final List<Transaction> transations;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  TransationList(this.transations);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  '${transations[index].amount.toStringAsFixed(2)} EGP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transations[index].title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMd().format(transations[index].date),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        itemCount: transations.length,
      ),
    );
  }
}
