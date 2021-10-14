import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';

class StartButton extends StatelessWidget {
  final double width;
  final double height;
  final onPressed;

  const StartButton({
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width*0.5,
      height: width*0.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(width*0.25)),
          color: kRed,
          boxShadow: [
            BoxShadow(
                color: kRed.withOpacity(0.5),
                offset: const Offset(0.0, 0.0),
                blurRadius: 30.0,
                spreadRadius: 0.1
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(width*0.3),
            splashColor: kRed,
            highlightColor: kRed,
            child: Center(
              child: Image.asset('assets/icons/hand.png'),
            )),
      ),
    );
  }
}