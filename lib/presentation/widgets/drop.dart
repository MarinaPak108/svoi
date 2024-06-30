import 'package:flutter/material.dart';
import 'package:svoi/domain/models/visa_models/reason_model.dart';

import 'package:svoi/core/color.dart' as clr;
import 'package:svoi/domain/global_settings.dart' as glb;

class DropDownMenu extends StatelessWidget {
  final List<FormModel> itms;
  final FormModel? selectedItm;
  final String label;
  final Function(FormModel?)? onChanged;
  //personal data input fields:
  final bool personalField = false;

  const DropDownMenu(
      {Key? key,
      required this.selectedItm,
      required this.itms,
      required this.label,
      this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = glb.globalHeight;
    return Container(
      padding: EdgeInsets.all(height * 0.2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height * 0.5),
          border: Border.all(
              color: clr.AppColors.green1,
              style: BorderStyle.solid,
              width: height * 0.05)),
      child: DropdownButton<FormModel>(
        menuMaxHeight: height * 5,
        isExpanded: true,
        //isDense: true,
        hint: Text(
          label,
          style: TextStyle(fontSize: height * 0.4),
        ),
        value: selectedItm,
        icon: const Icon(
          Icons.arrow_drop_down_rounded,
        ),
        iconSize: height,
        elevation: (height * 0.5).round(),
        style: const TextStyle(
          color: clr.AppColors.blue1,
        ),
        onChanged: onChanged,
        items: itms.map<DropdownMenuItem<FormModel>>((value) {
          return DropdownMenuItem<FormModel>(
            value: value,
            child: Text(
              value.formName,
              maxLines: 2,
              style: TextStyle(
                fontSize: height * 0.4,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
      ),
    );
  }
}
