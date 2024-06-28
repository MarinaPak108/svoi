import 'package:flutter/material.dart';

import 'package:svoi/core/color.dart' as clr;
import 'package:svoi/domain/global_settings.dart' as glb;
import 'package:svoi/presentation/pages/home.dart';
import 'package:svoi/presentation/pages/house.dart';
import 'package:svoi/presentation/pages/visa.dart';

class CustomNavigationBar extends StatefulWidget
    implements PreferredSizeWidget {
  const CustomNavigationBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentPageIndex = glb.bottomIndex;

  void changePage(int idx) {
    glb.bottomIndex = idx;
    switch (idx) {
      case (0):
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      case (1):
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Visa()));
      case (2):
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const House()));
      default:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
          changePage(index);
        });
      },
      indicatorColor: clr.AppColors.green3,
      selectedIndex: currentPageIndex,
      elevation: 8.0,
      shadowColor: clr.AppColors.green2,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'главная',
        ),
        NavigationDestination(
          icon: Badge(child: Icon(Icons.edit_document)),
          label: 'виза',
        ),
        NavigationDestination(
          icon: Badge(
            label: Text('2'),
            child: Icon(Icons.key),
          ),
          label: 'квартира',
        ),
      ],
    );
  }
}
