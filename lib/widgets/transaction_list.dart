import 'package:first_app/modules/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 660,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'images/hollow.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          onPressed: () => deleteTx(transactions[index].id),
                        )
                        //  FloatingActionButton.extended(
                        //   backgroundColor: Colors.white,
                        //   hoverElevation: 5,
                        //   onPressed: () {
                        //     showDialog<String>(
                        //       context: context,
                        //       builder: (BuildContext context) => AlertDialog(
                        //         title: const Text('Confirm Delete',
                        //             style: TextStyle(
                        //               fontSize: 20,
                        //               color: Colors.purpleAccent,
                        //             )),
                        //         content: Text(
                        //           'Do you really want to delete ${widget.transactions[index].title} ?',
                        //           style: TextStyle(
                        //             fontSize: 18,
                        //             color: Colors.purpleAccent,
                        //           ),
                        //         ),
                        //         actions: <Widget>[
                        //           TextButton(
                        //             // shape: RoundedRectangleBorder(
                        //             //   borderRadius: BorderRadius.all(
                        //             //     Radius.circular(5.0),
                        //             //   ),
                        //             // ),
                        //             onPressed: () =>
                        //                 Navigator.pop(context, 'Cancel'),
                        //             child: const Text('No',
                        //                 style: TextStyle(
                        //                   fontSize: 18,
                        //                   color: Colors.purpleAccent,
                        //                 )),
                        //           ),
                        //           TextButton(
                        //             style: TextButton.styleFrom(
                        //               primary: Colors.purpleAccent,
                        //               backgroundColor: Colors.white70,
                        //               elevation: 1,
                        //             ),
                        //             // shape: RoundedRectangleBorder(
                        //             //   borderRadius: BorderRadius.horizontal(
                        //             //       left: Radius.zero),
                        //             // ),
                        //             onPressed: () => setState(
                        //               () {
                        //                 widget.transactions.removeAt(index);
                        //                 Navigator.pop(context, 'Cancel');
                        //               },
                        //             ),
                        //             child: const Text('Yes',
                        //                 style: TextStyle(
                        //                   fontSize: 18,
                        //                   color: Colors.purpleAccent,
                        //                 )),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        //   label: const Text(
                        //     'Delete',
                        //     style: TextStyle(color: Colors.black),
                        //   ),
                        //   icon: Icon(Icons.delete_forever),
                        // ),
                        ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
