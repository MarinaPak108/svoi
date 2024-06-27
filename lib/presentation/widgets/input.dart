import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:svoi/core/color.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController? ctrl;
  final bool isPwdVisible;
  final IconButton? icn;
  final int lines;
  final bool isLatinOnly;

  const InputField(
      {Key? key,
      required this.label,
      this.ctrl,
      this.isPwdVisible = false,
      this.lines = 1,
      this.isLatinOnly = false,
      this.icn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: lines,
      obscureText: isPwdVisible,
      inputFormatters: (isLatinOnly)
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
            ]
          : null,
      style:
          const TextStyle(color: Color.fromARGB(255, 47, 47, 47), fontSize: 25),
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.blue2,
          label: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: AppColors.blue1,
                fontSize: 25,
                fontWeight: FontWeight.w900),
          ),
          suffixIcon: icn),
      controller: ctrl,
    );
  }
}
