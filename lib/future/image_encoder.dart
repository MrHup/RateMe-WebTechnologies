import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:rate_me/future/image_decoder.dart';
import 'package:rate_me/static/Global.dart';

class ImageEncoder extends StatefulWidget {
  @override
  _ImageEncoderState createState() => _ImageEncoderState();
}

class _ImageEncoderState extends State<ImageEncoder> {
  ByteData imageData;
  String _base64;

  @override
  void initState() {
    rootBundle
        .load(Global.imagePath)
        .then((data) => setState(() => this.imageData = data));

    print("Global " + Global.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    // rootBundle.load(Global.imagePath).then((data) => this.imageData = data);

    print("Global " + Global.imagePath);
    if (imageData == null) {
      return Center(child: CircularProgressIndicator());
    }

    _base64 = base64Encode(imageData.buffer.asUint8List());
    Global.imageBase64 = _base64;
    print(_base64);

    //return Image(image: MemoryImage(imageData.buffer.asUint8List()));
    return SizedBox();
  }
}
