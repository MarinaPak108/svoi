import 'package:flutter/material.dart';

class House extends StatelessWidget {
  const House({super.key});

  @override
  Widget build(BuildContext context) {
    return const _House();
  }
}

class _House extends StatefulWidget {
  const _House();

  @override
  State<_House> createState() => _HouseState();
}

class _HouseState extends State<_House> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Rent contract fill form'),
    );
  }
}
