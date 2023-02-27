import 'package:flutter/material.dart';

import '../models/lecture.dart';
class DataHelper{
  static List<String> _lettersList() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
}

  static double _letterPoints(String letter) {
    switch (letter) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0;
      default:
        return 0;
    }
  }

  static double calculateAverage() {
    double totalNotes = 0;
    double totalCredit = 0;

    for (var element in allLectures) {
      totalNotes = totalNotes + (element.credit * element.letterNoteValue);
      totalCredit += element.credit;
    }

    return totalNotes / totalCredit;
  }

  static List<DropdownMenuItem<double>> lectureLetters() {
    return _lettersList()
        .map(
          (e) => DropdownMenuItem(
        value: _letterPoints(e),
        child: Text(e),
      ),
    )
        .toList();
  }

  static List<int> _creditList() {
    return List.generate(10, (index) => index + 1).toList();
  }

  static List<DropdownMenuItem<double>> creditList() {
    return _creditList()
        .map((e) => DropdownMenuItem(
      value: e.toDouble(),
      child: Text(e.toString()),
    ))
        .toList();
  }

  static List<Lecture> allLectures = [];

  static addLecture(Lecture lecture) {
    allLectures.add(lecture);
  }
}
