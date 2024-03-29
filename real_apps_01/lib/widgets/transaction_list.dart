import 'package:flutter/material.dart';
import '../widgets/transaction_list_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('Build within TransactionList');
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              print('**********************************************');
              print(transactions[index].id);
              return TransactionListItem(
                key: ValueKey(transactions[index].id),
                transaction: transactions[index],
                deleteHandler: deleteTx,
              );
              // return Card(
              //   margin: const EdgeInsets.symmetric(
              //     vertical: 8,
              //     horizontal: 5,
              //   ),
              //   elevation: 5,
              //   child: ListTile(
              //     // leading: Container(
              //     //   height: 60,
              //     //   width: 60,
              //     //   decoration: BoxDecoration(
              //     //     color: Theme.of(context).primaryColor,
              //     //     shape: BoxShape.circle,
              //     //   ),
              //     //   child: Padding(
              //     //     padding: EdgeInsets.all(6),
              //     //     child: FittedBox(
              //     //       child: Text(
              //     //         '\$${transactions[index].amount.toStringAsFixed(2)}',
              //     //       ),
              //     //     ),
              //     //   ),
              //     // ),
              //     leading: CircleAvatar(
              //       radius: 30,
              //       child: Padding(
              //         padding: const EdgeInsets.all(6),
              //         child: FittedBox(
              //           child: Text(
              //             '\$${transactions[index].amount.toStringAsFixed(2)}',
              //           ),
              //         ),
              //       ),
              //     ),
              //     title: Text(
              //       transactions[index].title,
              //       style: Theme.of(context).textTheme.headline6,
              //     ),
              //     subtitle: Text(
              //       DateFormat.yMMMd().format(transactions[index].date),
              //     ),
              //     trailing: MediaQuery.of(context).size.width > 400
              //         ? TextButton.icon(
              //             style: TextButton.styleFrom(
              //               primary: Theme.of(context).errorColor,
              //             ),
              //             onPressed: () => deleteTx(transactions[index].id),
              //             icon: const Icon(Icons.delete),
              //             label: const Text('Delete'),
              //           )
              //         : IconButton(
              //             icon: const Icon(Icons.delete),
              //             color: Theme.of(context).errorColor,
              //             onPressed: () => deleteTx(transactions[index].id),
              //           ),
              //   ),
              // );
              // // return Card(
              // //   child: Row(
              // //     children: <Widget>[
              // //       Container(
              // //         margin: EdgeInsets.symmetric(
              // //           vertical: 10,
              // //           horizontal: 15,
              // //         ),
              // //         decoration: BoxDecoration(
              // //           border: Border.all(
              // //             color: Colors.purple,
              // //             width: 2,
              // //           ),
              // //         ),
              // //         padding: EdgeInsets.all(10),
              // //         child: Text(
              // //           '\$${transactions[index].amount.toStringAsFixed(2)}',
              // //           style: TextStyle(
              // //               fontWeight: FontWeight.bold,
              // //               fontSize: 20,
              // //               color: Theme.of(context).primaryColor),
              // //         ),
              // //       ),
              // //       Column(
              // //         crossAxisAlignment: CrossAxisAlignment.start,
              // //         children: <Widget>[
              // //           Text(
              // //             transactions[index].title,
              // //             style: Theme.of(context).textTheme.headline6,
              // //           ),
              // //           Text(
              // //             DateFormat.yMMMd().format(transactions[index].date),
              // //             style: TextStyle(
              // //               color: Colors.grey,
              // //             ),
              // //           )
              // //         ],
              // //       )
              // //     ],
              // //   ),
              // // );
            },
            itemCount: transactions.length,
          );
  }
}
