import 'package:flutter/material.dart';
import 'package:flutter_ayo_zakat/components/view_page.dart';
import 'animation/animation.dart';
import 'components/Strings.dart';
import 'package:page_transition/page_transition.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MyAnimation(
                1,
                Container(
                  height: 300,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 25, right: 25, top: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50.0),
                        bottomLeft: Radius.circular(50.0)),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        colors: [
                          Color.fromRGBO(255, 250, 182, 1),
                          Color.fromRGBO(255, 239, 78, 1)
                        ]),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyAnimation(
                          1,
                          Image.asset(
                            'assets/images/menu.png',
                            width: 20,
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: MyAnimation(
                              1.2,
                              Text(Strings.headerTitle,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(97, 90, 90, 1))),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: MyAnimation(
                                1.3, Image.asset('assets/images/intro3.png')),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            Transform.translate(
              offset: Offset(0, -35),
              child: MyAnimation(
                  1.2,
                  Container(
                    height: 60,
                    padding: EdgeInsets.only(left: 20, top: 8),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[350],
                              blurRadius: 20.0,
                              offset: Offset(0, 10.0))
                        ],
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.white),
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 20.0,
                          ),
                          border: InputBorder.none,
                          hintText: 'Search'),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyAnimation(
                        1.2,
                        Text('Pilih \nkategori',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromRGBO(97, 90, 90, 1))),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            MyAnimation(
                                1.2,
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.all(10),
                                  onPressed: () {},
                                  color: Color.fromRGBO(251, 53, 105, 0.1),
                                  child: Text('Zakat',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(251, 53, 105, 1),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                )),
                            SizedBox(
                              width: 20.0,
                            ),
                            MyAnimation(
                                1.3,
                                FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.all(10),
                                  onPressed: () {},
                                  color: Color.fromRGBO(97, 90, 90, 0.1),
                                  child: Text('Donasi',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(97, 90, 90, 0.6),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                )),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 280,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.only(bottom: 20, left: 20),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  MyAnimation(
                      1.3,
                      makeCard(
                          context: context,
                          startColor: Color.fromRGBO(251, 121, 155, 1),
                          endColor: Color.fromRGBO(251, 53, 105, 1),
                          image: 'assets/images/intro3.png')),
                  MyAnimation(
                      1.4,
                      makeCard(
                          context: context,
                          startColor: Color.fromRGBO(203, 251, 255, 1),
                          endColor: Color.fromRGBO(81, 223, 234, 1),
                          image: 'assets/images/intro3.png')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeCard({context, startColor, endColor, image}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            PageTransition(type: PageTransitionType.fade, child: ViewPage()));
      },
      child: AspectRatio(
        aspectRatio: 4 / 5,
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [startColor, endColor],
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[350],
                    blurRadius: 10,
                    offset: Offset(5, 10))
              ]),
          child: Padding(
            padding: EdgeInsets.all(50),
            child: Center(
              child: Image.asset(image),
            ),
          ),
        ),
      ),
    );
  }
}
