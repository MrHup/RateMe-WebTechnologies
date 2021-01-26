import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rate_me/custom_widgets/navigation_bar.dart';
import 'package:rate_me/custom_widgets/rate_page_widgets.dart';
import 'package:rate_me/static/Global.dart';
import 'package:rate_me/static/theme_data.dart';
import 'package:rate_me/custom_widgets/custom_extensions.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class MakeReviewPage extends StatefulWidget {
  @override
  _MakeReviewPageState createState() => _MakeReviewPageState();
}

class _MakeReviewPageState extends State<MakeReviewPage> {
  double rating = 3.0;
  final TextEditingController eCtrlFeedback = new TextEditingController();

  Widget starRatingWidget() {
    return Container(
      child: SmoothStarRating(
          allowHalfRating: true,
          onRated: (v) {},
          starCount: 5,
          rating: rating,
          size: 60.0,
          isReadOnly: false,
          // halfFilledIconData: Icons.blur_off,
          // filledIconData:Icons.blur_on ,
          color: CustomTheme.primary,
          borderColor: CustomTheme.secondary,
          spacing: 0.5),
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
              Container(child: avatarWithImageViewed(90, 5)).withExpanded(2),
              Text(
                Global.viewedUser.username,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 45,
                    color: Colors.white.withOpacity(0.8)),
              ).padded(15).withExpanded(2),
              starRatingWidget(),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 250,
                width: 400,
                child: TextField(
                  controller: eCtrlFeedback,
                  style: TextStyle(fontSize: 18),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ).paddedSides(25),
              ).paddedSides(15).paddedTop(20).withExpanded(4),
              reviewSubmitButton(context, rating, eCtrlFeedback),
            ]),
      ),
      bottomNavigationBar: NavBarCustom(),
    ).withGradient();
  }
}
