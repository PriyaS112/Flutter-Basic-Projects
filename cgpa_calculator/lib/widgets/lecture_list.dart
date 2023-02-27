
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../helper/data_helper.dart';
import '../models/lecture.dart';

class LectureList extends StatelessWidget {
  final Function onDismiss;
  const LectureList({required this.onDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Lecture> allLectures = DataHelper.allLectures;
    return allLectures.isNotEmpty
        ? ListView.builder(
        itemCount: allLectures.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.startToEnd,
            onDismissed: (a) {
              onDismiss(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: ListTile(
                  title: Text(allLectures[index].name),
                  leading: CircleAvatar(
                    child:
                    Text(allLectures[index].credit.toStringAsFixed(0)),
                  ),
                  subtitle: Text('Letter Note Value: ${allLectures[index].letterNoteValue}'),
                ),
              ),
            ),
          );
        })
        : Center(
            child: Text(
              'Please add lectures.',
              style: Constants.titleStyle.copyWith(fontSize:40),
            ));
  }
}