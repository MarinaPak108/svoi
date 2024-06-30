import 'package:flutter/material.dart';
import 'package:svoi/core/color.dart' as clr;
import 'package:svoi/core/size.dart' as sz;
import 'package:svoi/domain/global_settings.dart' as glb;

class TxtBlock extends StatelessWidget {
  final String txt;

  const TxtBlock({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      SizedBox(
        height: glb.globalHeight * 0.6,
      ),
      Expanded(
          child: Divider(
        thickness: glb.globalHeight * 0.1,
        color: clr.AppColors.blue2,
      )),
      Text(
        txt,
        style: TextStyle(
            fontSize: glb.globalHeight * 0.5, color: clr.AppColors.blue2),
      ),
      Expanded(
          child: Divider(
        thickness: glb.globalHeight * 0.1,
        color: clr.AppColors.blue2,
      )),
      SizedBox(
        height: glb.globalHeight,
      ),
    ]);
  }
}
