import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SexIcon extends StatelessWidget {
  final IconData? icon;
  final String sex;

  const SexIcon({super.key, this.icon, required this.sex});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.black38,
          size: 50,
        ),
        const SizedBox(height: 15),
        Text(
          sex,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.black38,
          ),
        )
      ],
    );
  }
}

class MyContainerWidget extends StatelessWidget {
  final Widget? child;
  final Color? myColor;
  final VoidCallback? onPress;
  final VoidCallback? onDoublePress;
  MyContainerWidget(
      {this.child,
        this.myColor = Colors.white,
        this.onPress,
        this.onDoublePress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      onDoubleTap: onDoublePress,
      child: Container(
        margin: const EdgeInsets.all(12.0),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: myColor),
        child: child,
      ),
    );
  }
}

class SliderTextColumn extends StatelessWidget {
  final double number;
  final String text;
  final onChanged;
  final double max;
  final int? divisions;
  SliderTextColumn(
      {required this.text,
        required this.number,
        required this.onChanged,
        required this.max,
        this.divisions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          text,
          style: const TextStyle(color: Colors.black54, fontSize: 18),
        ),
        Text(
          number.round().toString(),
          style: const TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Slider(
          min: 0,
          max: max,
          value: number,
          divisions: divisions,
          onChanged: onChanged,
        )
      ],
    );
  }
}

class PlusMinusWidget extends StatelessWidget {
  final String? text;
  final double? number;
  final VoidCallback? onPressPlus;
  final VoidCallback? onPressMinus;

  PlusMinusWidget(
      {this.text, this.number, this.onPressPlus, this.onPressMinus});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            text!,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            number!.toInt().toString(),
            style: const TextStyle(
                fontSize: 30,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: onPressPlus,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                minimumSize: const Size(50, 50),
              ),
              child: const Icon(
                FontAwesomeIcons.plus,
                size: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: onPressMinus,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                minimumSize: const Size(50, 50),
              ),
              child: const Icon(
                FontAwesomeIcons.minus,
                size: 20,
              ),
            )
          ],
        ),
      ],
    );
  }
}