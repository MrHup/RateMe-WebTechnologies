import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rate_me/custom_widgets/custom_extensions.dart';
import 'package:rate_me/future/image_decoder.dart';
import 'package:rate_me/future/session_requests.dart';
import 'package:rate_me/static/theme_data.dart';
import 'package:rate_me/static/Global.dart';

Widget avatar(String code, double radius, double padding) {
  code = code.toUpperCase();
  return CircleAvatar(
    backgroundColor: Colors.white,
    child: Text(
      code,
      style: TextStyle(fontSize: radius / 2, color: CustomTheme.primary),
    ),
    radius: radius,
  ).center().padded(padding);
}

Widget avatarWithImage(double radius, double padding) {
  return Stack(children: [
    CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage:
          imageFromBase64String(Global.currentUser.profileImg).image,
      radius: radius,
    ).center().padded(padding),
    Text(
      Global.currentUser.score.toStringAsFixed(1),
      style: TextStyle(fontSize: 70, color: Colors.white),
    ).center().paddedTop(80)
  ]);
}

Widget avatarWithImageViewed(double radius, double padding) {
  return Stack(children: [
    CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage:
          imageFromBase64String(Global.viewedUser.profileImg).image,
      radius: radius,
    ).center().padded(padding),
    // Text(
    //   Global.currentUser.score.toStringAsFixed(1),
    //   style: TextStyle(fontSize: 70, color: Colors.white),
    // ).center().paddedTop(80)
  ]);
}

Widget avatarWithImageIndex(double radius, double padding, int index) {
  return Stack(children: [
    CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage:
          imageFromBase64String(Global.currentUser.profileImg).image,
      radius: radius,
    ).center().padded(padding),
  ]);
}

Widget avatarWithImageIndexSearched(double radius, double padding, int index) {
  return Stack(children: [
    CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage:
          imageFromBase64String(Global.searchedUsers[index].profileImg).image,
      radius: radius,
    ).center().padded(padding),
  ]);
}

Widget personButton(context, int index, String name) {
  return new Column(children: [
    RaisedButton(
      color: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      highlightElevation: 0,
      hoverElevation: 0,
      hoverColor: Colors.transparent,
      onPressed: () {
        Global.viewedUser = Global.users[index];

        Navigator.of(context).pushNamedAndRemoveUntil(
            '/makeReviewPage', ModalRoute.withName('/makeReviewPage'));
      },
      elevation: 0,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage:
            imageFromBase64String(Global.users[index].profileImg).image,
        radius: 38,
      ),
    ),
    Text(name, style: TextStyle(color: CustomTheme.primary, fontSize: 10))
  ]).padded(5);
}

Widget reviewSubmitButton(
    BuildContext context, double score, TextEditingController eCtrlFeedback) {
  return RaisedButton(
    color: CustomTheme.primary,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: CustomTheme.primary)),
    onPressed: () {
      makeReview(Global.viewedUser.username, Global.currentUser.username,
          eCtrlFeedback.text, score);

      Navigator.of(context).pushNamedAndRemoveUntil(
          '/ratePage', ModalRoute.withName('/ratePage'));
    },
    child: Container(
      width: 160,
      height: 40,
      child: Text(
        'Submit review',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ).center(),
    ),
  );
}

Widget reviewItem(context, int index, String content, double score) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/reviewPage', ModalRoute.withName('/reviewPage'));
    },
    child: Card(
        color: Colors.white12,
        elevation: 0,
        child: Row(
          children: [
            avatar(
                Global.reviews[index].fromuser[0] +
                    Global.reviews[index].fromuser[1],
                25,
                5),
            //avatar('HF', 25, 5).withExpanded(1),
            SizedBox(
              width: 15,
            ),
            Text(Global.reviews[index].fromuser,
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomTheme.primary,
                        fontWeight: FontWeight.bold))
                .paddedRight(5),
            Text(
              content,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ).withExpanded(5),
            SizedBox(
              width: 15,
            ),
            Text(score.toStringAsFixed(1), style: TextStyle(fontSize: 20))
                .center(),
            Icon(Icons.star_rate),
            SizedBox(
              width: 15,
            ),
            // star
          ],
        )),
  );
}

Widget inputGenerator(String label, String iname, double ht) {
  return Container(
    child: Row(
      children: [
        Text(label, style: TextStyle(fontSize: 18)).paddedLeft(20),
        Text(
          iname,
          style: TextStyle(fontSize: 18),
        ).paddedSides(25).alignStart(),
      ],
    ),
    decoration: new BoxDecoration(
      color: Colors.white30,
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    margin: EdgeInsets.symmetric(vertical: 10.0),
    height: ht,
    width: 400,
  );
}
