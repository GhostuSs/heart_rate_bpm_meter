
import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';

class StartButton extends StatelessWidget {
  final double width;
  final double height;
  final onPressed;
  bool flag=false;
  int label=0;
  StartButton({Key? key,
    this.width = double.infinity,
    this.height = 50.0,
    required this.onPressed,
    required this.flag,
    required this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: flag ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('$label',style: const TextStyle(
                    color: kWhite,
                    fontFamily: 'OpenSans-Regular',
                    fontWeight: FontWeight.w600,
                    fontSize: 48
                  )),
                  const Text('Bpm',style: TextStyle(
                    color: kWhite,
                    fontSize: 14,
                    fontFamily: 'OpenSans-Regular',
                    fontWeight: FontWeight.w600
                  )),
                ],
              )
              :Image.asset('assets/icons/hand.png'),
            )),
      ),
    );
  }
}