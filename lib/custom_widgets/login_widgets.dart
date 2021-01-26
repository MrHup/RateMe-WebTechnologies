import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rate_me/future/image_encoder.dart';
import 'package:rate_me/future/session_requests.dart';
import 'package:rate_me/future/show_toast.dart';
import 'package:rate_me/static/Global.dart';
import 'package:rate_me/static/theme_data.dart';
import 'custom_extensions.dart';

Widget emailFieldInput(final TextEditingController eCtrlEmail) {
  return Container(
    decoration: new BoxDecoration(
      color: Colors.white,
      borderRadius: new BorderRadius.all(new Radius.circular(25.7)),
    ),
    width: 400,
    child: TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: 'Username',
        prefixIcon: Icon(Icons.person),
        border: InputBorder.none,
      ),
      controller: eCtrlEmail,
      style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
      onSubmitted: (text) {},
    ),
  ).padded(8).paddedSides(30);
}

Widget firstnameInput(final TextEditingController eCtrlFName) {
  return Container(
    decoration: new BoxDecoration(
      color: Colors.white,
      borderRadius: new BorderRadius.all(new Radius.circular(25.7)),
    ),
    width: 400,
    child: TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: 'First Name',
        prefixIcon: Icon(Icons.person),
        border: InputBorder.none,
      ),
      controller: eCtrlFName,
      style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
      onSubmitted: (text) {},
    ),
  ).padded(8).paddedSides(30);
}

Widget lastnameInput(final TextEditingController eCtrlLName) {
  return Container(
    decoration: new BoxDecoration(
      color: Colors.white,
      borderRadius: new BorderRadius.all(new Radius.circular(25.7)),
    ),
    width: 400,
    child: TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: 'Last Name',
        prefixIcon: Icon(Icons.person),
        border: InputBorder.none,
      ),
      controller: eCtrlLName,
      style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
      onSubmitted: (text) {},
    ),
  ).padded(8).paddedSides(30);
}

Widget addressInput(final TextEditingController eCtrlLAddress) {
  return Container(
    decoration: new BoxDecoration(
      color: Colors.white,
      borderRadius: new BorderRadius.all(new Radius.circular(25.7)),
    ),
    width: 400,
    child: TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: 'Address',
        prefixIcon: Icon(Icons.map_outlined),
        border: InputBorder.none,
      ),
      controller: eCtrlLAddress,
      style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
      onSubmitted: (text) {},
    ),
  ).padded(8).paddedSides(30);
}

Widget passwordInput(final TextEditingController eCtrlPass) {
  return Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(25.7))),
    width: 400,
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Password',
        prefixIcon: Icon(Icons.lock),
        fillColor: Colors.white,
        border: InputBorder.none,
      ),
      controller: eCtrlPass,
      obscureText: true,
      style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
      onSubmitted: (text) {},
    ),
  ).padded(8).paddedSides(30);
}

Widget confirmpasswordInput(final TextEditingController eCtrlPass) {
  return Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(25.7))),
    width: 400,
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Confirm password',
        prefixIcon: Icon(Icons.lock),
        fillColor: Colors.white,
        border: InputBorder.none,
      ),
      controller: eCtrlPass,
      obscureText: true,
      style: TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
      onSubmitted: (text) {},
    ),
  ).padded(8).paddedSides(30);
}

Widget loginButton(BuildContext context, final TextEditingController eCtrlEmail,
    final TextEditingController eCtrlPass) {
  return RaisedButton(
    color: CustomTheme.primary,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: CustomTheme.primary)),
    onPressed: () {
      //makeReview("Ion", "bobby", "Msg", 4.0);

      // Navigator.of(context).pushNamedAndRemoveUntil(
      //     '/ratePage', ModalRoute.withName('/ratePage'));

      if (eCtrlEmail.text == '' || eCtrlPass.text == '') {
        showToast("Please fill out all fields.");
      } else {
        loginAccount(context, eCtrlEmail.text, eCtrlPass.text);
        //print(eCtrlEmail.text + '  ' + eCtrlPass.text);
      }
    },
    child: Container(
      width: 160,
      height: 40,
      child: Text(
        'Login',
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ).center(),
    ),
  );
}

Widget registerButton(
    BuildContext context,
    final TextEditingController eCtrlEmail,
    final TextEditingController eCtrlPass,
    final TextEditingController eCtrlPass2,
    final TextEditingController eCtrlFName,
    final TextEditingController eCtrlLName,
    final TextEditingController eCtrlAddress) {
  return RaisedButton(
    color: CustomTheme.primary,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        side: BorderSide(color: CustomTheme.primary)),
    onPressed: () {
      if (eCtrlEmail.text == '' ||
          eCtrlPass.text == '' ||
          eCtrlPass2.text == '' ||
          eCtrlAddress.text == '' ||
          eCtrlFName.text == '' ||
          eCtrlLName.text == '') {
        showToast("Please fill out all fields.");
        print("Global status " + Global.imagePath);
        print("Global base64 " + Global.imageBase64);
      } else if (eCtrlPass.text != eCtrlPass2.text) {
        showToast("The passwords don't match.");
      } else {
        // ImageEncoder();
        registerAccount(
            context,
            eCtrlEmail.text,
            eCtrlPass.text,
            eCtrlFName.text,
            eCtrlLName.text,
            eCtrlAddress.text,
            Global.imageBase64);
      }
    },
    child: Container(
      width: 160,
      height: 40,
      child: Text(
        'Register',
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      ).center(),
    ),
  ).paddedSides(70).padded(8);
}

Widget registerNow(BuildContext context) {
  return RawMaterialButton(
    onPressed: () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/registerPage', ModalRoute.withName('/registerPage'));
    },
    child: Text(
      'New to the platform? Join us',
      style: TextStyle(color: Colors.white, fontSize: 14),
    ).center(),
  ).padded(10);
}

Widget loginNow(BuildContext context) {
  return RawMaterialButton(
    onPressed: () {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/loginPage', ModalRoute.withName('/loginPage'));
    },
    child: Text(
      'Already have an account? Click here',
      style: TextStyle(color: Colors.white, fontSize: 14),
    ).center(),
  ).padded(10);
}

Widget logoutButton(BuildContext context) {
  var padding = Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        'Logout',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      Icon(
        Icons.exit_to_app,
        color: Colors.white,
      )
    ],
  );
  return RaisedButton(
    onPressed: () {
      Global.currentUser = null;
      Global.selectedIndex = 2;
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/loginPage', ModalRoute.withName('/loginPage'));
    },
    color: CustomTheme.primary,
    child: Container(
      height: 40,
      child: padding,
    ),
  ).center().padded(10);
}
