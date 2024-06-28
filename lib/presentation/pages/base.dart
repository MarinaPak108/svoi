import 'dart:math';

import 'package:flutter/material.dart';
import 'package:svoi/presentation/pages/home.dart';
import 'package:svoi/presentation/widgets/button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

import 'package:svoi/domain/global_settings.dart' as glb;
import 'package:svoi/core/color.dart' as clr;

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _BasePage();
  }
}

class _BasePage extends StatefulWidget {
  const _BasePage();

  @override
  State<_BasePage> createState() => _MainPageState();
}

class _MainPageState extends State<_BasePage> {
  final _img_options = [
    'assets/img/winter.jpg',
    'assets/img/spring.jpg',
    'assets/img/summer.jpg',
    'assets/img/fall.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final _random = new Random();
    String img = _img_options[_random.nextInt(_img_options.length)];
    return Column(
        // Sets the content of the Application
        children: [
          Padding(
            padding: EdgeInsets.all(glb.globalHeight * 0.3),
            child: DropShadowImage(
              offset: Offset(glb.globalHeight * 0.8, glb.globalHeight * 0.8),
              scale: 1,
              blurRadius: glb.globalHeight,
              borderRadius: glb.globalHeight,
              image: Image.asset(
                img,
                height: glb.globalHeight * 7,
                width: glb.globalWidth * 7,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(glb.globalHeight * 0.3),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(glb.globalHeight * 0.3),
                child: Btn(
                  name: '',
                  clr: clr.AppColors.blue2,
                  width: glb.globalWidth * 7,
                  richText: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.edit_document,
                              color: clr.AppColors.blue1,
                              size: glb.globalHeight * 0.8),
                        ),
                        TextSpan(
                          text: " продление визы",
                          style: GoogleFonts.lobster(
                            color: clr.AppColors.blue1,
                            fontSize: glb.globalHeight * 0.7,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    glb.bottomIndex = 1;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(glb.globalHeight * 0.3),
                child: Btn(
                  name: 'Rent',
                  width: glb.globalWidth * 7,
                  onPressed: () {
                    glb.bottomIndex = 2;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                ),
              )
            ]),
          ),
        ]);
  }
}
