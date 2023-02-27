import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../helper/data_helper.dart';

class LetterDropDown extends StatefulWidget {
  final Function onChosenLetter;
  const LetterDropDown({required this.onChosenLetter, Key? key})
      : super(key: key);

  @override
  _LetterDropDownState createState() => _LetterDropDownState();
}

class _LetterDropDownState extends State<LetterDropDown> {
  double chosenLetterValue = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: Constants.dropDownPadding,
        decoration: BoxDecoration(
            color: Constants.appColor.shade100.withOpacity(0.8),
            borderRadius: Constants.buttonBorderRadius),
        child: DropdownButton<double>(
          value: chosenLetterValue,
          elevation: 30,
          iconEnabledColor: Constants.appColor.shade200,
          onChanged: (value) {
            setState(() {
              chosenLetterValue = value!;
              widget.onChosenLetter(chosenLetterValue);
            });
          },
          underline: Container(),
          items: DataHelper.lectureLetters(),
        ));
  }
}

class CreditDropDown extends StatefulWidget {
  final Function onChosenCredit;
  const CreditDropDown({required this.onChosenCredit, Key? key})
      : super(key: key);

  @override
  _CreditDropDownState createState() => _CreditDropDownState();
}

class _CreditDropDownState extends State<CreditDropDown> {
  double chosenCreditValue = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: Constants.dropDownPadding,
        decoration: BoxDecoration(
            color: Constants.appColor.shade100.withOpacity(0.8),
            borderRadius: Constants.buttonBorderRadius),
        child: DropdownButton<double>(
          value: chosenCreditValue,
          elevation: 30,
          iconEnabledColor: Constants.appColor.shade200,
          onChanged: (value) {
            setState(() {
              chosenCreditValue = value!;
              widget.onChosenCredit(chosenCreditValue);
            });
          },
          underline: Container(),
          items: DataHelper.creditList(),
        ));
  }
}