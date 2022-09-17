import 'package:flutter/material.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({this.color = Colors.black});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
