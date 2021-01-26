import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rate_me/custom_widgets/rate_page_widgets.dart';
import 'package:rate_me/future/session_requests.dart';
import 'package:rate_me/static/Global.dart';
import 'package:rate_me/custom_widgets/custom_extensions.dart';
import 'package:rate_me/static/theme_data.dart';

Widget userBar(context, int index, String img, String content, double score) {
  return GestureDetector(
    onTap: () {
      // Navigator.of(context).pushNamedAndRemoveUntil(
      //     '/profilePage', ModalRoute.withName('/profilePage'));
    },
    child: Card(
        color: Colors.white12,
        elevation: 0,
        child: Row(
          children: [
            // avatar('HF', 25, 5).withExpanded(1),
            avatarWithImageIndexSearched(25, 5, index),
            SizedBox(
              width: 15,
            ),
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
