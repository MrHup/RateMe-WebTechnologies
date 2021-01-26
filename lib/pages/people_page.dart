import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rate_me/custom_widgets/navigation_bar.dart';
import 'package:rate_me/custom_widgets/people_widgets.dart';
import 'package:rate_me/custom_widgets/rate_page_widgets.dart';
import 'package:rate_me/static/Global.dart';
import 'package:rate_me/static/theme_data.dart';
import 'package:rate_me/custom_widgets/custom_extensions.dart';
import 'package:rate_me/future/session_requests.dart';

class PeoplePage extends StatefulWidget {
  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  final TextEditingController eCtrlSearch = new TextEditingController();
  Widget searchFieldInput(final TextEditingController eCtrlSearch) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white38,
        borderRadius: new BorderRadius.all(new Radius.circular(15)),
      ),
      width: 600,
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: 'Search user',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
        controller: eCtrlSearch,
        style:
            TextStyle(color: CustomTheme.primary, fontWeight: FontWeight.bold),
        onSubmitted: (text) {
          setState(() {
            searchUser(eCtrlSearch.text);
          });
        },
      ),
    ).paddedTop(5);
  }

  Widget submitButtonSearch() {
    return RaisedButton(
      color: CustomTheme.primary,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: CustomTheme.primary)),
      onPressed: () {
        setState(() {
          searchUser(eCtrlSearch.text);
        });
      },
      child: Container(
        width: 160,
        height: 40,
        child: Text(
          'Search',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            searchFieldInput(eCtrlSearch),
            // Container(
            //     width: 140,
            //     child: FittedBox(
            //       fit: BoxFit.contain,
            //       child: Image.asset('lib/assets/title_main.png'),
            //     )).withExpanded(2),
            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 10),
            //   height: 100,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     children: <Widget>[
            //       // personButton(context),
            //       // personButton(context),
            //       // personButton(context),
            //       // personButton(context),
            //       // personButton(context),
            //     ],
            //   ),
            // ).withExpanded(2),
            Container(
              decoration: new BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 120,
              width: 1200,
              child: new ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: Global.searchedUsers.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return userBar(
                        context,
                        index,
                        Global.searchedUsers[index].username,
                        Global.searchedUsers[index].username,
                        Global.searchedUsers[index].score);
                  }),
              // child: ListView(
              //   shrinkWrap: true,
              //   children: <Widget>[
              //     // userBar(context, 'abcd',
              //     //     'Lorem ipsum abcdefsaoijdsiaojdoadjias', 4.1),
              //   ],
              // ),
            ).withExpanded(7),
            submitButtonSearch(),
          ],
        ),
      ).padded(20),
      bottomNavigationBar: NavBarCustom(),
    ).withGradient();
  }
}
