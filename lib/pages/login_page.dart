import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rate_me/custom_widgets/login_widgets.dart';
import 'package:rate_me/future/image_encoder.dart';

import '../custom_widgets/custom_extensions.dart';
import 'package:rate_me/static/theme_data.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController eCtrlEmail = new TextEditingController();
  final TextEditingController eCtrlPass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Image(
              width: 400,
              image: AssetImage('lib/assets/rateME_logo.png'),
            ).scaleEvenly(0.6),
          ),
          emailFieldInput(eCtrlEmail),
          passwordInput(eCtrlPass),
          loginButton(context, eCtrlEmail, eCtrlPass),
          registerNow(context),
        ],
      ).center(),
    ).withGradient();
  }
}
