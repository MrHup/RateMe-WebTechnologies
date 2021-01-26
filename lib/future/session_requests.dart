import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rate_me/future/show_toast.dart';
import 'package:rate_me/static/Global.dart';
import 'package:rate_me/static/Review.dart';
import 'dart:convert';

import 'package:rate_me/static/User.dart';

void getUsersLocationClose() {
  getUsersWithAddress(
      Global.currentUser.address, 10, Global.currentUser.username);
}

void getReviewsForCurrentUser() {
  getUserReviews(Global.currentUser.username, 10);
}

void loginAccount(
    BuildContext context, String username, String password) async {
  print("Trying to login");
  final http.Response response = await http.post(
    'https://webtechnologies-rateme.herokuapp.com/login',
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'username': username,
      'password': password,
    }),
  );
  if (response.statusCode != 200) {
    print(response.statusCode);
    print('Failed to login');
    showToast("Failed to login");
  } else {
    print(json.decode(response.body));
    final responseJson = json.decode(response.body);
    User currentUser = new User.fromJson(responseJson[0]);
    Global.currentUser = currentUser;
    print(currentUser.username);

    getUsersLocationClose();
    getReviewsForCurrentUser();

    Navigator.of(context).pushNamedAndRemoveUntil(
        '/profilePage', ModalRoute.withName('/profilePage'));
  }
}

void registerAccount(
    BuildContext context,
    String username,
    String password,
    String firstname,
    String lastname,
    String address,
    String profileImg) async {
  print("Trying to register");
  final http.Response response = await http.post(
    'https://webtechnologies-rateme.herokuapp.com/signup',
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'username': username,
      'password': password,
      'firstname': firstname,
      'lastname': lastname,
      'address': address,
      'score': 0.0,
      'reviewcount': 0,
      'profileImg': profileImg,
    }),
  );
  if (response.statusCode != 200) {
    print(response.statusCode);
    print('Failed to register');
  } else {
    print('Account registered successfully');
    showToast('Account registered successfully');
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/loginPage', ModalRoute.withName('/loginPage'));
  }
}

void makeReview(
    String toUser, String fromUser, String review, double score) async {
  print("Trying to register");
  final http.Response response = await http.post(
    'https://webtechnologies-rateme.herokuapp.com/addreview',
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'touser': toUser,
      'fromuser': fromUser,
      'review': review,
      'score': score,
    }),
  );
  if (response.statusCode != 201) {
    print(response.statusCode);
    print('Failed to add review');
  }
}

void searchUser(String username) async {
  final http.Response response = await http.get(
      'https://webtechnologies-rateme.herokuapp.com/search?searchuser=' +
          username);
  if (response.statusCode != 200) {
    print(response.statusCode);
    print('Failed to search');
  } else {
    var list = jsonDecode(response.body) as List;
    Global.searchedUsers = list.map((json) => User.fromJson(json)).toList();
  }
}

void getUsersWithAddress(String address, int number, String curuser) async {
  final http.Response response = await http.get(
      'https://webtechnologies-rateme.herokuapp.com/users?address=' +
          address +
          '&number=' +
          number.toString() +
          '&curuser=' +
          curuser);
  if (response.statusCode != 200) {
    print(response.statusCode);
    print('Failed to search');
  } else {
    var list = jsonDecode(response.body) as List;
    print(list);
    Global.users = list.map((json) => User.fromJson(json)).toList();

    print(Global.users);
  }
}

void getUserReviews(String curuser, int number) async {
  final http.Response response = await http.get(
      'https://webtechnologies-rateme.herokuapp.com/userreviews?' +
          'curuser=' +
          curuser +
          '&number=' +
          number.toString());
  if (response.statusCode != 200) {
    print(response.statusCode);
    print('Failed to search');
  } else {
    var list = jsonDecode(response.body) as List;
    print(list);
    Global.reviews = list.map((json) => Review.fromJson(json)).toList();

    print(Global.reviews);
  }
}
