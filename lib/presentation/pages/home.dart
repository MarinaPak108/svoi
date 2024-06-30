import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svoi/presentation/pages/house.dart';
import 'package:svoi/presentation/pages/base.dart';
import 'package:svoi/presentation/pages/login.dart';
import 'package:svoi/presentation/pages/visa.dart';

import 'package:svoi/domain/global_settings.dart' as glb;
import 'package:svoi/core/color.dart' as clr;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences prefs;
  int currentPageIndex = glb.bottomIndex;
  final _pageOptions = [const BasePage(), const Visa(), const House()];

  logout() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("isSteySinged", false);
    prefs.setString("login", "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "SVOI APP",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),
          actions: <Widget>[
            //IconButton
            IconButton(
              icon: Icon(
                Icons.logout_outlined,
                color: clr.AppColors.blue1,
                size: 30,
                weight: glb.globalHeight * 0.1,
              ),
              tooltip: 'Выйти',
              onPressed: () {
                logout();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ), //IconButton
          ], //<Widget>[]
          backgroundColor: clr.AppColors.green1,
          elevation: 50.0,
          leading: const Icon(
            Icons.handshake_sharp,
            color: clr.AppColors.blue1,
            size: 40.0,
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        // Sets the content to the
        // center of the application page
        body: _pageOptions[currentPageIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: clr.AppColors.green3,
          selectedIndex: currentPageIndex,
          backgroundColor: clr.AppColors.green1,
          elevation: 8.0,
          shadowColor: clr.AppColors.green2,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: clr.AppColors.blue1,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: clr.AppColors.blue2,
              ),
              label: 'главная',
            ),
            NavigationDestination(
              icon: Badge(
                  child: Icon(
                Icons.article_outlined,
                color: clr.AppColors.blue2,
              )),
              selectedIcon: Icon(
                Icons.article,
                color: clr.AppColors.blue1,
              ),
              label: 'виза',
            ),
            NavigationDestination(
              icon: Badge(
                label: Text('2'),
                child: Icon(
                  Icons.add_home_work_outlined,
                  color: clr.AppColors.blue2,
                ),
              ),
              selectedIcon: Icon(
                Icons.add_home_work,
                color: clr.AppColors.blue1,
              ),
              label: 'жильё',
            ),
          ],
        ));
  }
}
