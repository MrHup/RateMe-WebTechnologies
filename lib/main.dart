import 'package:flutter/material.dart';

import 'package:rate_me/pages/login_page.dart';
import 'package:rate_me/pages/make_review_page.dart';
import 'package:rate_me/pages/profile_page.dart';
import 'package:rate_me/pages/rate_page.dart';
import 'package:rate_me/pages/register_page.dart';
import 'package:rate_me/pages/people_page.dart';
import 'package:rate_me/static/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rate Me',
      theme: CustomTheme.getTheme(),
      routes: <String, WidgetBuilder>{
        '/loginPage': (BuildContext context) => LoginPage(),
        '/registerPage': (BuildContext context) => RegisterPage(),
        '/ratePage': (BuildContext context) => RatePage(),
        '/makeReviewPage': (BuildContext context) => MakeReviewPage(),
        '/peoplePage': (BuildContext context) => PeoplePage(),
        '/profilePage': (BuildContext context) => ProfilePage(),
      },
      home: LoginPage(),
    );
  }
}
