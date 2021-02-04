import 'package:flutter/material.dart';
import 'package:flutter_ayo_zakat/components/make_card.dart';
import 'package:flutter_ayo_zakat/components/menu_bg_style.dart';
import 'package:flutter_ayo_zakat/components/menu_list.dart';
import 'package:flutter_ayo_zakat/components/view_page_donasi.dart';
import 'package:flutter_ayo_zakat/components/view_page_zakat.dart';
import 'animation/animation.dart';
import 'components/Strings.dart';
import 'package:page_transition/page_transition.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  final Duration duration = const Duration(milliseconds: 300);
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Stack(
      children: [
        MenuList(),
        MenuBgStyles(),
        AnimatedPositioned(
          duration: duration,
          top: 0,
          bottom: 0,
          left: isCollapsed ? 0 : 0.6 * screenWidth,
          right: isCollapsed ? 0 : -0.2 * screenWidth,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Material(
              animationDuration: duration,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              elevation: 8,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    MyAnimation(
                        1,
                        Container(
                          height: 300,
                          width: double.infinity,
                          padding:
                              EdgeInsets.only(left: 25, right: 25, top: 60),
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
                              Container(
                                height: 20,
                                width: 20,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (isCollapsed)
                                        _controller.forward();
                                      else
                                        _controller.reverse();

                                      isCollapsed = !isCollapsed;
                                    });
                                  },
                                  child: MyAnimation(
                                      1,
                                      Image.asset(
                                        'assets/images/menu.png',
                                        width: 20,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    flex: 4,
                                    child: MyAnimation(
                                      1.2,
                                      Text(Strings.headerTitle,
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  97, 90, 90, 1))),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: MyAnimation(
                                        1.3,
                                        Image.asset(
                                            'assets/images/dashboard1.png')),
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
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          padding: EdgeInsets.all(10),
                                          onPressed: () {},
                                          color:
                                              Color.fromRGBO(251, 53, 105, 0.1),
                                          child: Text('Zakat',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      251, 53, 105, 1),
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
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          padding: EdgeInsets.all(10),
                                          onPressed: () {},
                                          color:
                                              Color.fromRGBO(203, 251, 255, 1),
                                          child: Text('Donasi',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      81, 223, 234, 1),
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
                                  text: 'Zakat',
                                  textTapMe: 'Tap untuk melanjutkan',
                                  startColor: Color.fromRGBO(251, 121, 155, 1),
                                  endColor: Color.fromRGBO(251, 53, 105, 1),
                                  image: 'assets/images/dashboard2.png',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: ViewPageZakat()));
                                  })),
                          MyAnimation(
                              1.4,
                              makeCard(
                                  context: context,
                                  text: 'Donasi',
                                  textTapMe: 'Tap untuk melanjutkan',
                                  startColor: Color.fromRGBO(203, 251, 255, 1),
                                  endColor: Color.fromRGBO(81, 223, 234, 1),
                                  image: 'assets/images/dashboard3.png',
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            child: ViewPageDonasi()));
                                  })),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
