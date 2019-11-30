import 'package:flutter/material.dart';
import 'package:lancul/UIview/PostView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../appTheme.dart';

class experienceScreen extends StatefulWidget {
  final AnimationController animationController;

  const experienceScreen({Key key, this.animationController}) : super(key: key);
  @override
  _experienceScreenState createState() => _experienceScreenState();
}

class _experienceScreenState extends State<experienceScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;

  final _firestore = Firestore.instance;

  List<Widget> listViews = List<Widget>();
  var scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
    getExperiences();
  }

  void getExperiences() async {
    final experiences =
        await _firestore.collection('experiences').getDocuments();
    for (var experience in experiences.documents) {
      print(experience.data);
    }
  }

  void addAllListData() {
    var count = 5;

    listViews.add(
      PostView(
        imagePath:
            'https://saudievents.sa/Content/Events-Images/c0d82e82-7f81-49f1-b5b7-8b56ef2b780f/1.png',
        titleTxt: 'مهرجان الدرعية للفروسيّة',
        subTxt: 'Riyadh',
        rating: 4.3,
        priceTxt: 150,
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      PostView(
        imagePath:
            'https://saudievents.sa/Content/Events-Images/c0d82e82-7f81-49f1-b5b7-8b56ef2b780f/1.png',
        titleTxt: 'مهرجان الدرعية للفروسيّة',
        subTxt: 'Riyadh',
        rating: 4.3,
        priceTxt: 150,
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      PostView(
        imagePath:
            'https://saudievents.sa/Content/Events-Images/c0d82e82-7f81-49f1-b5b7-8b56ef2b780f/1.png',
        titleTxt: 'مهرجان الدرعية للفروسيّة',
        subTxt: 'Riyadh',
        rating: 4.3,
        priceTxt: 150,
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      PostView(
        imagePath:
            'https://saudievents.sa/Content/Events-Images/c0d82e82-7f81-49f1-b5b7-8b56ef2b780f/1.png',
        titleTxt: 'مهرجان الدرعية للفروسيّة',
        subTxt: 'Riyadh',
        rating: 4.3,
        priceTxt: 150,
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      PostView(
        imagePath:
            'https://saudievents.sa/Content/Events-Images/c0d82e82-7f81-49f1-b5b7-8b56ef2b780f/1.png',
        titleTxt: 'مهرجان الدرعية للفروسيّة',
        subTxt: 'Riyadh',
        rating: 4.3,
        priceTxt: 150,
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      PostView(
        imagePath:
            'https://saudievents.sa/Content/Events-Images/c0d82e82-7f81-49f1-b5b7-8b56ef2b780f/1.png',
        titleTxt: 'مهرجان الدرعية للفروسيّة',
        subTxt: 'Riyadh',
        rating: 4.3,
        priceTxt: 150,
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
          return ListView.builder(
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
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: topBarAnimation,
              child: new Transform(
                transform: new Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppTheme.grey.withOpacity(0.4 * topBarOpacity),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Experiences",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: AppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}