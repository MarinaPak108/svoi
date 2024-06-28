import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svoi/presentation/pages/home.dart';
import 'package:svoi/core/color.dart' as clr;
import 'package:svoi/domain/global_settings.dart' as glb;
import 'package:svoi/presentation/pages/login.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
    return const _Splash();
  }
}

class _Splash extends StatefulWidget {
  const _Splash();

  @override
  State<_Splash> createState() => _SplashState();
}

class _SplashState extends State<_Splash> {
  late bool userIsLoggedIn;
  late SharedPreferences prefs;
  getLoggedInState() async {
    prefs = await SharedPreferences.getInstance();
    final bool? isSigned;
    if (prefs.containsKey("isSteySinged")) {
      isSigned = prefs.getBool("isSteySinged");
    } else {
      isSigned = false;
    }
    setState(() {
      if (isSigned == null) isSigned == false;
      userIsLoggedIn = isSigned!;
    });
  }

  @override
  void initState() {
    super.initState();
    getLoggedInState();
    Future.delayed(const Duration(seconds: 10), _routeUser);
  }

  void _routeUser() {
    //if user is stay logged in
    if (userIsLoggedIn) {
      if (prefs.containsKey("login")) {
        glb.userId = prefs.getString("login")!;
      }
      //Navigator.push() esli nujno nazad na stranicu wernutsja tak kak on zagrujaet power predidushei stranici = sohranjaet predidushuju stranicu
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (cxt) => const HomePage()));
    }
    //if stay logged in => redirect to home page
    else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (cxt) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    glb.globalWidth = MediaQuery.sizeOf(context).height / 10;
    glb.globalHeight = MediaQuery.sizeOf(context).width / 10;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                clr.AppColors.blue2,
                clr.AppColors.green3,
                clr.AppColors.green1
              ]),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Icon(
                  Icons.handshake_sharp,
                  color: clr.AppColors.blue1,
                  size: 50.0,
                ),
                Text(
                  "Ваш проводник жизни в Корее",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(clr.AppColors.green2),
            ),
          ],
        ),
      ),
    );
  }
}
