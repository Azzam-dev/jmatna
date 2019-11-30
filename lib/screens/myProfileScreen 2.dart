import 'package:lancul/UIview/MenuItemView.dart';
import 'package:lancul/UIview/titleView.dart';
import 'package:lancul/UIview/profileView.dart';
import 'package:flutter/material.dart';
import 'package:lancul/screens/menuScreems/aboutUsScreen.dart';
import 'package:lancul/screens/menuScreems/favoriteScreen.dart';
import 'package:lancul/screens/menuScreems/feedbackScreen.dart';
import 'package:lancul/screens/menuScreems/helpScreen.dart';
import 'package:lancul/screens/menuScreems/inviteFriendScreen.dart';
import 'package:lancul/screens/menuScreems/messagesScreen.dart';
import 'package:lancul/screens/menuScreems/rateTheAppScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../appTheme.dart';
import '../main.dart';

class myProfileScreen extends StatefulWidget {
  final AnimationController animationController;

  const myProfileScreen({Key key, this.animationController}) : super(key: key);
  @override
  _myProfileScreenState createState() => _myProfileScreenState();
}

class _myProfileScreenState extends State<myProfileScreen>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;

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
  }

  void addAllListData() {
    var count = 5;

    listViews.add(
      ProfileView(
        userImage: NetworkImage(
            "https://instagram.fdmm2-2.fna.fbcdn.net/vp/68aad55c6de07d6527edba218f789ff2/5E62FCE3/t51.2885-19/s150x150/43507749_320635631821770_8561044253965287424_n.jpg?_nc_ht=instagram.fdmm2-2.fna.fbcdn.net"),
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
      TitleView(
        titleTxt: 'Area of focus',
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      MenuItemView(
        titleTxt: 'Favorite',
        navigateScreen: FavoriteScreen(),
        menuIcon: Icon(Icons.favorite, color: Colors.orange),
        backgroundGradient: LinearGradient(colors: [
          AppTheme.white,
          AppTheme.nearlyWhite,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      MenuItemView(
        titleTxt: 'messages',
        navigateScreen: MessagesScreen(),
        menuIcon: Icon(Icons.chat, color: Colors.orange),
        backgroundGradient: LinearGradient(colors: [
          AppTheme.white,
          AppTheme.nearlyWhite,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      MenuItemView(
        titleTxt: 'Help',
        navigateScreen: HelpScreen(),
        menuIcon: Icon(Icons.help, color: Colors.orange),
        backgroundGradient: LinearGradient(colors: [
          AppTheme.white,
          AppTheme.nearlyWhite,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      MenuItemView(
        titleTxt: 'Feedback',
        navigateScreen: FeedbackScreen(),
        menuIcon: Icon(Icons.feedback, color: Colors.orange),
        backgroundGradient: LinearGradient(colors: [
          AppTheme.white,
          AppTheme.nearlyWhite,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      MenuItemView(
        titleTxt: 'Invite Friend',
        navigateScreen: InviteFriendScreen(),
        menuIcon: Icon(Icons.share, color: Colors.orange),
        backgroundGradient: LinearGradient(colors: [
          AppTheme.white,
          AppTheme.nearlyWhite,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      MenuItemView(
        titleTxt: 'Rate the app',
        navigateScreen: RateTheAppScreen(),
        menuIcon: Icon(Icons.rate_review, color: Colors.orange),
        backgroundGradient: LinearGradient(colors: [
          AppTheme.white,
          AppTheme.nearlyWhite,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
      ),
    );

    listViews.add(
      MenuItemView(
        titleTxt: 'About Us',
        navigateScreen: AboutUsScreen(),
        menuIcon: Icon(Icons.info, color: Colors.orange),
        backgroundGradient: LinearGradient(colors: [
          AppTheme.white,
          AppTheme.nearlyWhite,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController,
            curve:
                Interval((1 / count) * 3, 1.0, curve: Curves.fastOutSlowIn))),
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
                                  "my Profile",
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
                            FlatButton(
                              onPressed: () {},
                              child: Container(
                                margin: new EdgeInsets.all(10.0),
                                child: Center(
                                    child: Icon(
                                  Icons.exit_to_app,
                                  color: Colors.redAccent,
                                )),
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
