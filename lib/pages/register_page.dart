import 'dart:ui';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rate_me/custom_widgets/login_widgets.dart';
import 'package:rate_me/future/image_encoder.dart';
import 'package:rate_me/static/Global.dart';

import '../custom_widgets/custom_extensions.dart';
import 'package:rate_me/static/theme_data.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController eCtrlEmail = new TextEditingController();
  final TextEditingController eCtrlPass = new TextEditingController();
  final TextEditingController eCtrlPass2 = new TextEditingController();
  final TextEditingController eCtrlFName = new TextEditingController();
  final TextEditingController eCtrlLName = new TextEditingController();
  final TextEditingController eCtrlAddress = new TextEditingController();

  File _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print("!!Setting image path " + pickedFile.path);
        Global.imagePath = pickedFile.path;
        ImageEncoder();
      } else {
        print('No image selected.');
      }
    });
  }

  Widget profileImg() {
    if (_image == null) {
      return MaterialButton(
        onPressed: () {
          print("Pressed");
          getImage();
        },
        child: new Container(
          width: 190.0,
          height: 190.0,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                      "https://www.searchpng.com/wp-content/uploads/2019/02/Profile-ICon.png"))),
        ),
      );
    }
    return new Container(
      width: 190.0,
      height: 190.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
            image: new FileImage(_image),
            fit: BoxFit.fill,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Global.imagePath = 'lib/assets/userAvatarTest.png';
    // ImageEncoder();
    // var x = new ImageEncoder2();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(child: ImageEncoder()),
            profileImg().padded(24),
            emailFieldInput(eCtrlEmail),
            passwordInput(eCtrlPass),
            confirmpasswordInput(eCtrlPass2),
            firstnameInput(eCtrlFName),
            lastnameInput(eCtrlLName),
            addressInput(eCtrlAddress),
            registerButton(context, eCtrlEmail, eCtrlPass, eCtrlPass2,
                eCtrlFName, eCtrlLName, eCtrlAddress),
            loginNow(context),
          ],
        ),
      ),
    ).withGradient();
  }
}
