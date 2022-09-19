import 'package:flutter/material.dart';

class Spacing extends StatelessWidget {
  const Spacing(this.size, {Key? key}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
    );
  }
}
