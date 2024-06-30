import 'package:flutter/material.dart';
import 'package:svoi/presentation/pages/visa/visa_data.dart';
import 'package:svoi/presentation/widgets/tap.dart';

import 'package:svoi/core/size.dart' as sz;

class Visa extends StatelessWidget {
  const Visa({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Visa();
  }
}

class _Visa extends StatefulWidget {
  const _Visa();
  @override
  State<_Visa> createState() => _VisaState();
}

class _VisaState extends State<_Visa> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(sz.SizeApp.paddingSize), child: buildTap());
  }

  Widget buildTap() => const MyTapSections(
      text1: "F4 Виза",
      text2: "Другие",
      widget1: VisaData(),
      widget2: Text('Not F4'));
}
