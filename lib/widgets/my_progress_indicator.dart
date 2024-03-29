import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {

  final double containerSize;
  final double progressSize;

  const MyProgressIndicator({Key? key, required this.containerSize, this.progressSize=60}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize, // Non-nullable로 접근
      height: containerSize, // Non-nullable로 접근
      child: Center(
        child: SizedBox(
          height: progressSize,
          width: progressSize,
          child: Image.asset('assets/images/loading_img.gif'))));
  }
}
