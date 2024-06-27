import 'package:flutter/material.dart';
import 'package:svoi/core/color.dart';

import 'package:svoi/domain/global_settings.dart' as global;

class Btn extends StatelessWidget {
  final String name;
  final double? width;
  final void Function()? onPressed;

  const Btn({Key? key, required this.name, this.onPressed, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: global.globalWidth * 3.5,
      height: MediaQuery.sizeOf(context).height / 10,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(4.0),
              disabledBackgroundColor: AppColors.green2,
              backgroundColor: AppColors.blue2),
          onPressed: onPressed,
          child: Text(
            name,
            style: const TextStyle(color: AppColors.blue1, fontSize: 20),
          )),
    );
  }
}
