import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:working_test/model/primes_class.dart';
import 'package:working_test/view_model/notivier_provider.dart';

class HistoryList extends StatelessWidget {
  final List<PrimesClass> primeList;
  const HistoryList({Key key, this.primeList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: ListView.builder(
        itemCount: primeList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  primeList[index].timeIn,
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  primeList[index].primesInt.toString(),
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
// HistoryList
