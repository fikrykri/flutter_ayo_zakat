import 'package:flutter/material.dart';
import 'package:flutter_ayo_zakat/dashboard.dart';

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Padding(
        padding: EdgeInsets.only(left: 0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 500,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage()));
                  },
                  splashColor: Colors.yellowAccent,
                  color: Colors.grey[100],
                  elevation: 0,
                  child: Text("Dashboard",
                      style: TextStyle(color: Colors.black, fontSize: 22)),
                ),
              ),
              Divider(
                color: Colors.grey[200],
              ),
              Container(
                width: 500,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage()));
                  },
                  splashColor: Colors.redAccent,
                  color: Colors.grey[100],
                  elevation: 0,
                  child: Text("Profile",
                      style: TextStyle(color: Colors.black, fontSize: 22)),
                ),
              ),
              Divider(
                color: Colors.grey[200],
                height: 10,
                thickness: 1,
                indent: 120,
              ),
              Container(
                width: 500,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardPage()));
                  },
                  splashColor: Colors.blueAccent,
                  color: Colors.grey[100],
                  elevation: 0,
                  child: Text("Setting",
                      style: TextStyle(color: Colors.black, fontSize: 22)),
                ),
              ),
              Divider(
                color: Colors.grey[200],
                height: 10,
                thickness: 1,
                indent: 120,
              ),
              Container(
                width: 500,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    MaterialPageRoute(builder: (context) => DashboardPage());
                  },
                  splashColor: Colors.greenAccent,
                  color: Colors.grey[100],
                  elevation: 0,
                  child: Text("About Us",
                      style: TextStyle(color: Colors.black, fontSize: 22)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
