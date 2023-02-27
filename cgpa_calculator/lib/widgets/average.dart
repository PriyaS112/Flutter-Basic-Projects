import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int lectureNum;
  const ShowAverage({required this.average, required this.lectureNum, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lectureNum > 0 ? 'Total Lecture: $lectureNum' : 'Add Lecture',
          style: Constants.lectureStyle.copyWith(fontSize: 20),
          ),
        Text(
          average > 0 ? average.toStringAsFixed(2) : '0.00',
          style: Constants.averageStyle.copyWith(fontSize: 30),
        ),
        Text('Average',style: Constants.lectureStyle, ),
      ],
    );
  }
}