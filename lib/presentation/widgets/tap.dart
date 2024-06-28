import 'package:flutter/material.dart';

import 'package:svoi/core/color.dart' as clr;
import 'package:svoi/domain/global_settings.dart' as glb;

class MyTapSections extends StatelessWidget {
  final String text1;
  final String text2;
  final Widget widget1;
  final Widget widget2;
  const MyTapSections(
      {Key? key,
      required this.text1,
      required this.text2,
      required this.widget1,
      required this.widget2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TabBar(
            tabs: [
              Tab(text: text1),
              Tab(text: text2),
            ],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: clr.AppColors.green2,
            labelColor: clr.AppColors.blue1,
            labelStyle: TextStyle(
                color: clr.AppColors.blue1,
                fontSize: glb.globalHeight * 0.5,
                fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(
                fontSize: glb.globalHeight * 0.4, fontFamily: 'Family Name'),
          ),
          Expanded(
            child: Container(
              //Add this to give height
              //height: MediaQuery.of(context).size.height * 0.4,
              child: TabBarView(children: [
                widget1,
                widget2,
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
