import 'package:flutter/material.dart';
import 'package:svoi/presentation/widgets/button.dart';
import 'package:svoi/presentation/widgets/nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:svoi/domain/global_settings.dart' as glb;
import 'package:svoi/core/color.dart' as clr;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SVOI App'),
      ),
      // Sets the content to the
      // center of the application page
      body: Column(
          // Sets the content of the Application
          children: [
            Image(
              image: const AssetImage('assets/img/summer.jpg'),
              fit: BoxFit.fill,
              height: glb.globalHeight * 7,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Btn(
                        name: 'Rent',
                        width: glb.globalWidth * 7,
                      ),
                    )
                  ]),
            ),
          ]),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
