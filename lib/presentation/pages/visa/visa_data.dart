import 'package:flutter/material.dart';
import 'package:svoi/presentation/widgets/input.dart';

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
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
}
