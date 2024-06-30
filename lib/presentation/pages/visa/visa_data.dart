import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svoi/domain/models/fillform.dart';
import 'package:svoi/domain/models/visa_models/reason_model.dart';
import 'package:svoi/presentation/widgets/drop.dart';
import 'package:svoi/presentation/widgets/input.dart';
import 'package:svoi/presentation/widgets/text_block.dart';

import 'package:svoi/domain/global_settings.dart' as glb;
import 'package:svoi/core/color.dart' as clr;

class VisaData extends StatelessWidget {
  const VisaData({super.key});

  @override
  Widget build(BuildContext context) {
    return const _VisaData();
  }
}

class _VisaData extends StatefulWidget {
  const _VisaData();

  @override
  State<_VisaData> createState() => _VisaDataState();
}

class _VisaDataState extends State<_VisaData> {
  FormModel? _selectedReason;
  List<FormModel> list = FillForm().initReasonsF4();
  FormModel? _selectedGender;
  List<FormModel> genderList = FillForm().initGender();
  //related to personal input fields
  final _controllerName = TextEditingController();
  final _controllerSurname = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerName.addListener(() {});
    _controllerSurname.addListener(() {});
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerSurname.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        DropDownMenu(
          selectedItm: _selectedReason,
          itms: genderList,
          label: "Цель подачи",
          onChanged: (FormModel? newValue) {
            setState(() {
              _selectedReason = newValue;
            });
          },
        ),
        //personal data column
        (_selectedReason != null)
            ? Column(
                children: [
                  const TxtBlock(
                    txt: 'personal data',
                  ),
                  InputField(
                    label: ' ',
                    ctrl: _controllerName,
                    isLatinOnly: true,
                    fontSz: glb.globalHeight * 0.4,
                    richText: RichText(
                      text: TextSpan(
                        text: '',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Фамиля',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: glb.globalHeight * 0.4,
                                  color: clr.AppColors.blue1)),
                          TextSpan(
                              text: '   (как в загран паспорте)',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  fontSize: glb.globalHeight * 0.4)),
                        ],
                      ),
                    ),
                  ),
                  InputField(
                    label: '',
                    isLatinOnly: true,
                    ctrl: _controllerSurname,
                    fontSz: glb.globalHeight * 0.4,
                    richText: RichText(
                      text: TextSpan(
                        text: '',
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Имя',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: glb.globalHeight * 0.4,
                                  color: clr.AppColors.blue1)),
                          TextSpan(
                              text: '   (как в загран паспорте)',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  fontSize: glb.globalHeight * 0.4)),
                        ],
                      ),
                    ),
                  ),
                  DropDownMenu(
                    selectedItm: _selectedGender,
                    itms: list,
                    label: "Пол",
                    onChanged: (FormModel? newValue) {
                      setState(() {
                        _selectedGender = newValue;
                      });
                    },
                  )
                ],
              )
            : Container(),
        //visa data
        (_selectedGender != null)
            ? const TxtBlock(
                txt: 'visa data',
              )
            : Container(),
      ],
    );
  }
}
