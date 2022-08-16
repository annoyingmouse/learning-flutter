import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionListItem extends StatefulWidget {
  final Transaction transaction;
  final Function deleteHandler;

  const TransactionListItem({
    Key? key,
    required this.transaction,
    required this.deleteHandler,
  }) : super(key: key);

  @override
  State<TransactionListItem> createState() => _TransactionListItemState();
}

class _TransactionListItemState extends State<TransactionListItem> {
  Color? _bgColor;

  @override
  void initState() {
    super.initState();
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];
    _bgColor = availableColors[Random().nextInt(4)];
  }

  @override
  Widget build(BuildContext context) {
    print('**********************************************');
    print('Build within TransactionListItem');
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${widget.transaction.amount.toStringAsFixed(2)}',
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton.icon(
                style: TextButton.styleFrom(
                  primary: Theme.of(context).errorColor,
                ),
                onPressed: () => widget.deleteHandler(widget.transaction.id),
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteHandler(widget.transaction.id),
              ),
      ),
    );
  }
}
