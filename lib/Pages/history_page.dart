import 'package:flutter/material.dart';
import 'package:flutter_ayo_zakat/Model/history.dart';
import 'package:flutter_ayo_zakat/Pages/dashboard.dart';
import 'package:flutter_ayo_zakat/Widgets/list_history.dart';
import 'package:flutter_ayo_zakat/animation/animation.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<History> listHistory = Provider.of<List<History>>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        brightness: Brightness.light,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DashboardPage()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.blueAccent,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Center(
                child: MyAnimation(
                  1,
                  Text(
                    "History",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: listHistory.length,
                    itemBuilder: (BuildContext buildContext, int index) {
                      return InkWell(
                          child: ListHistory(history: listHistory[index]),
                          onTap: () {});
                    },
                    separatorBuilder: (BuildContext buildContext, int index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                  ),
                  // StreamBuilder(
                  //   stream: FirebaseFirestore.instance
                  //       .collection('history')
                  //       .snapshots(),
                  //   builder: (BuildContext context,
                  //       AsyncSnapshot<QuerySnapshot> snapshot) {
                  //     if (!snapshot.hasData) {
                  //       return Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }
                  //     return ListView(
                  //       scrollDirection: Axis.vertical,
                  //       children: snapshot.data.docs.map((document) {
                  //         History history = History(
                  //           id: document['id'],
                  //           name: document['name'],
                  //           image: document['image'],
                  //           nominal: document['nominal'],
                  //           status: document['status'],
                  //         );
                  //         return InkWell(
                  //           child: ListHistory(history: history),
                  //           onTap: () {},
                  //         );
                  //       }).toList(),
                  //     );
                  //   },
                  // ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
