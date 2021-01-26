import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rate_me/custom_widgets/login_widgets.dart';
import 'package:rate_me/custom_widgets/navigation_bar.dart';
import 'package:rate_me/custom_widgets/rate_page_widgets.dart';
import 'package:rate_me/pages/rate_page.dart';
import 'package:rate_me/static/Global.dart';
import 'package:rate_me/static/theme_data.dart';
import 'package:rate_me/custom_widgets/custom_extensions.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double rating = 3.0;

  Widget starRatingWidget(rate) {
    return Container(
      child: SmoothStarRating(
          allowHalfRating: true,
          onRated: (v) {},
          starCount: 5,
          rating: Global.currentUser.score,
          size: 60.0,
          isReadOnly: true,
          color: CustomTheme.primary,
          borderColor: CustomTheme.secondary,
          spacing: 0.5),
    );
  }

  Widget textInfoElem(String msg) {
    return Container(
      width: 400,
      height: 70,
      child: Card(
        elevation: 0,
        color: Colors.white24,
        child: Text(
          msg,
          style: TextStyle(fontSize: 22, color: Colors.black45),
        ).center(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(child: avatarWithImage(90, 5)),
              Text(
                Global.currentUser.username,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 45,
                    color: Colors.white.withOpacity(0.8)),
              ).padded(15),
              starRatingWidget(4.5),
              textInfoElem("Fist Name: " + Global.currentUser.firstname),
              textInfoElem("Last Name: " + Global.currentUser.lastname),
              logoutButton(context),
            ]),
      ),
      bottomNavigationBar: NavBarCustom(),
    ).withGradient();
  }
}
