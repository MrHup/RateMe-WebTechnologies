import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rate_me/custom_widgets/navigation_bar.dart';
import 'package:rate_me/custom_widgets/rate_page_widgets.dart';
import 'package:rate_me/future/session_requests.dart';
import 'package:rate_me/static/Global.dart';
import 'package:rate_me/static/theme_data.dart';
import 'package:rate_me/custom_widgets/custom_extensions.dart';

class RatePage extends StatefulWidget {
  @override
  _RatePageState createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/profilePage', ModalRoute.withName('/profilePage'));
                },
                child: avatarWithImage(90, 5).withExpanded(6)),
            Container(
                width: 140,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset('lib/assets/title_main.png'),
                )).withExpanded(2),
            Container(
              margin: EdgeInsets.symmetric(vertical: 2),
              height: 100,
              child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Global.users.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return personButton(
                        ctxt, index, Global.users[index].username);
                  }),
            ).withExpanded(3),
            Container(
              decoration: new BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 120,
              width: 1200,
              child: new ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: Global.reviews.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return reviewItem(ctxt, index, Global.reviews[index].review,
                        Global.reviews[index].score);
                  }),
              // child: ListView(
              //   shrinkWrap: true,
              //   children: <Widget>[
              //     reviewItem(context, 'abcd',
              //         'Lorem ipsum abcdefsaoijdsiaojdoadjias', 4.1),
              //   ],
              // ),
            ).withExpanded(6),
          ],
        ),
      ).padded(20),
      bottomNavigationBar: NavBarCustom(),
    ).withGradient();
  }
}
