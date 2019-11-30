import 'package:flutter/material.dart';
import 'package:lancul/UIview/profileView.dart';

import '../appTheme.dart';

class friendScreen extends StatefulWidget {
  final AnimationController animationController;

  const friendScreen({Key key, this.animationController}) : super(key: key);
  @override
  _friendScreenState createState() => _friendScreenState();
}

class _friendScreenState extends State<friendScreen>
    with TickerProviderStateMixin {
  List<Widget> listViews = List<Widget>();
  var scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    addAllListData();

    super.initState();
  }

  void addAllListData() {
    var count = 5;

    listViews.add(
      ProfileView(
        username: 'Azzam Al-Rashed',
        bio:
            'I am from Saudi Arabia and I speak fluent English and study in Japan undergraduate',
        rating: '4.5',
        languages: 'العربيَّة , English , 日本語',
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      ProfileView(
        username: 'Azzam Al-Rashed',
        bio:
            'I am from Saudi Arabia and I speak fluent English and study in Japan undergraduate',
        rating: '4.5',
        languages: 'العربيَّة , English , 日本語',
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      ProfileView(
        username: 'Azzam Al-Rashed',
        bio:
            'I am from Saudi Arabia and I speak fluent English and study in Japan undergraduate',
        rating: '4.5',
        languages: 'العربيَّة , English , 日本語',
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      ProfileView(
        username: 'Azzam Al-Rashed',
        bio:
            'I am from Saudi Arabia and I speak fluent English and study in Japan undergraduate',
        rating: '4.5',
        languages: 'العربيَّة , English , 日本語',
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        } else {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 45,
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  padding: EdgeInsets.only(
                    top: AppBar().preferredSize.height +
                        MediaQuery.of(context).padding.top +
                        24,
                    bottom: 62 + MediaQuery.of(context).padding.bottom,
                  ),
                  itemCount: listViews.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    widget.animationController.forward();
                    return listViews[index];
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }

//جنس القائد
  String guideGender;
// علم القائد
  String guideFlag;

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, Widget child) {
            return Container(
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppTheme.grey.withOpacity(0.4),
                      offset: Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).padding.top,
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Friends",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: AppTheme.fontName,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 28,
                                  letterSpacing: 1.2,
                                  color: AppTheme.darkerText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Container(
                          height: 50,
                          // لستت الاعلام التي يمكن سحبها
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0.0),
                            children: <Widget>[
                              //ازرار الاعلام
                              FlagBTN(
                                flagName: 'America',
                                guideFlag: guideFlag,
                                onPressed: () {
                                  //This is for America
                                  if (guideFlag == 'America') {
                                    guideFlag = null;
                                  } else {
                                    guideFlag = 'America';
                                  }
                                  print(guideFlag);
                                  setState(() {});
                                },
                              ),
                              FlagBTN(
                                flagName: 'Japan',
                                guideFlag: guideFlag,
                                onPressed: () {
                                  //This is for Japan
                                  if (guideFlag == 'Japan') {
                                    guideFlag = null;
                                  } else {
                                    guideFlag = 'Japan';
                                  }
                                  print(guideFlag);
                                  setState(() {});
                                },
                              ),
                              FlagBTN(
                                flagName: 'Saudi-Arabia',
                                guideFlag: guideFlag,
                                onPressed: () {
                                  //This is for Saudi-Arabia
                                  if (guideFlag == 'Saudi-Arabia') {
                                    guideFlag = null;
                                  } else {
                                    guideFlag = 'Saudi-Arabia';
                                  }
                                  print(guideFlag);
                                  setState(() {});
                                },
                              ),
                              FlagBTN(
                                flagName: 'Brazil',
                                guideFlag: guideFlag,
                                onPressed: () {
                                  //This is for Brazil
                                  if (guideFlag == 'Brazil') {
                                    guideFlag = null;
                                  } else {
                                    guideFlag = 'Brazil';
                                  }
                                  print(guideFlag);
                                  setState(() {});
                                },
                              ),
                              FlagBTN(
                                flagName: 'France',
                                guideFlag: guideFlag,
                                onPressed: () {
                                  //This is for France
                                  if (guideFlag == 'France') {
                                    guideFlag = null;
                                  } else {
                                    guideFlag = 'France';
                                  }
                                  print(guideFlag);
                                  setState(() {});
                                },
                              ),
                              FlagBTN(
                                flagName: 'Spain',
                                guideFlag: guideFlag,
                                onPressed: () {
                                  //This is for Spain
                                  if (guideFlag == 'Spain') {
                                    guideFlag = null;
                                  } else {
                                    guideFlag = 'Spain';
                                  }
                                  print(guideFlag);
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}

class FlagBTN extends FlatButton {
  const FlagBTN({
    Key key,
    @required this.flagName,
    @required this.guideFlag,
    @required VoidCallback onPressed,
  }) : super(key: key, onPressed: onPressed);

  final String flagName;
  final String guideFlag;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (onPressed),
      child: Container(
        margin: new EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: (guideFlag == flagName ? Colors.blue : Colors.black26),
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 0.0, // has the effect of extending the shadow
            )
          ],
        ),
        child: Center(
          child: Image.asset(
            'assets/images/flags/' + flagName + '.png',
          ),
        ),
      ),
    );
  }
}
