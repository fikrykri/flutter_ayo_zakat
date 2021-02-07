import 'package:flutter/material.dart';
import 'package:flutter_ayo_zakat/Model/history.dart';

class ListHistory extends StatefulWidget {
  final History history;

  ListHistory({@required this.history});
  @override
  _ListHistoryState createState() => _ListHistoryState();
}

class _ListHistoryState extends State<ListHistory> {
  @override
  Widget build(BuildContext context) {
    // final fullWidth = MediaQuery.of(context).size.width;
    return Container(
      // width: fullWidth,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 50, color: Colors.grey[200]))),
      child: Row(
        children: [
          Text(
            widget.history.name,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "Rp. " + widget.history.nominal.toString(),
            style: TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
