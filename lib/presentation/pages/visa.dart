import 'package:flutter/material.dart';

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
    return const Center(
      child: Text('Visa extend'),
    );
  }
}
