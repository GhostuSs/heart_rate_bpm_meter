import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';

class RawCard extends StatelessWidget{
  String labelPrefix='';
  var data=0;
  RawCard(this.data,this.labelPrefix, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
          boxShadow: [
            BoxShadow(
                spreadRadius: 4,
                blurRadius: 10,
                color: kDarkGray.withOpacity(0.15),
                offset: const Offset(0, 6)
            )],
          color: kWhite,
          borderRadius: BorderRadius.circular(10)
      ),
      height: 100,
      width: MediaQuery.of(context).size.width*0.42,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$labelPrefix value:',
              style: const TextStyle(
                  color: kBlack,
                  fontFamily: 'OpenSans-Regular',
                  fontWeight: FontWeight.w600,
                  fontSize: 18
              ),
            ),
            const SizedBox(height: 8),
            Text(
                '$data Bpm',
                style: const TextStyle(
                    color: kRed,
                    fontFamily: 'OpenSans-Regular',
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                )
            )
          ],
        ),
      ),
    );
  }

}