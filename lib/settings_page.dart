import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ayo_zakat/animation/animation.dart';
import 'package:flutter_ayo_zakat/dashboard.dart';
import 'package:flutter_ayo_zakat/firebase_auth.dart';
import 'package:flutter_ayo_zakat/login_page.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Center(
              child: MyAnimation(
                1,
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            MyAnimation(
              1.1,
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Account",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            MyAnimation(
              1.1,
              Divider(
                height: 15,
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MyAnimation(
              1.2,
              buildAccountOptionRow(context, "Change password"),
            ),
            MyAnimation(
              1.2,
              buildAccountOptionRow(context, "Content settings"),
            ),
            MyAnimation(
              1.2,
              buildAccountOptionRow(context, "Social"),
            ),
            MyAnimation(
              1.2,
              buildAccountOptionRow(context, "Language"),
            ),
            MyAnimation(
              1.2,
              buildAccountOptionRow(context, "Privacy and security"),
            ),
            SizedBox(
              height: 40,
            ),
            MyAnimation(
              1.3,
              Row(
                children: [
                  Icon(
                    Icons.volume_up_outlined,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            MyAnimation(
              1.3,
              Divider(
                height: 15,
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MyAnimation(
              1.4,
              buildNotificationOptionRow("New for you", true),
            ),
            MyAnimation(
              1.4,
              buildNotificationOptionRow("Account activity", true),
            ),
            MyAnimation(
              1.4,
              buildNotificationOptionRow("Opportunity", false),
            ),
            SizedBox(
              height: 50,
            ),
            MyAnimation(
                1.5,
                Center(
                  child: OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () async {
                      AuthService.signOut();
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false);
                    },
                    child: Text("SIGN OUT",
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2.2,
                            color: Colors.blueAccent)),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.blueAccent[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.blueAccent[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
