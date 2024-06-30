import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:svoi/core/color.dart';
import 'package:svoi/domain/global_settings.dart' as glb;

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController? ctrl;
  final bool isPwdVisible;
  final IconButton? icn;
  final Widget? richText;
  final int lines;
  final bool isLatinOnly;
  final bool isActive;
  final double? fontSz;

  const InputField(
      {Key? key,
      required this.label,
      this.ctrl,
      this.isPwdVisible = false,
      this.richText,
      this.lines = 1,
      this.isActive = true,
      this.isLatinOnly = false,
      this.fontSz,
      this.icn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(glb.globalHeight * 0.1),
      child: TextField(
        maxLines: lines,
        enabled: isActive,
        obscureText: isPwdVisible,
        inputFormatters: (isLatinOnly)
            ? <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
              ]
            : null,
        style: TextStyle(
            color: Color.fromARGB(255, 47, 47, 47),
            fontSize: (fontSz == null) ? glb.globalHeight * 0.5 : fontSz),
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.blue2,
            label: (richText == null)
                ? Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: AppColors.blue1,
                        fontSize:
                            (fontSz == null) ? glb.globalHeight * 0.5 : fontSz,
                        fontWeight: FontWeight.w900),
                  )
                : richText,
            suffixIcon: icn),
        controller: ctrl,
      ),
    );
  }
}
