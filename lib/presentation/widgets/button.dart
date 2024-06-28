import 'package:flutter/material.dart';
import 'package:svoi/core/color.dart';

import 'package:svoi/domain/global_settings.dart' as global;

class Btn extends StatelessWidget {
  final String name;
  final Widget? richText;
  final double? width;
  final Color? clr;
  final void Function()? onPressed;

  const Btn(
      {Key? key,
      required this.name,
      this.onPressed,
      this.width,
      this.richText,
      this.clr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (width == null) ? global.globalWidth * 3.5 : width,
      height: MediaQuery.sizeOf(context).height / 10,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(4.0),
              disabledBackgroundColor: (clr == null) ? AppColors.green2 : clr,
              backgroundColor: (clr == null) ? AppColors.blue2 : clr),
          onPressed: onPressed,
          child: (richText == null)
              ? Text(
                  name,
                  style: const TextStyle(color: AppColors.blue1, fontSize: 20),
                )
              : richText),
    );
  }
}
