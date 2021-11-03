import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';

Widget rawCard(String text,onPressed){
  return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        splashColor: kLightGray,
        highlightColor: kLightGray,
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: kLightGray.withOpacity(0.15)
          ),
          child: Card(
            color: kWhite,
            elevation: 30.0,
            shadowColor: kLightGray.withOpacity(0.3),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                        text,
                        style: const TextStyle(
                            color: kBlack,
                            fontWeight: FontWeight.w500,
                            fontSize: 19.0,
                            fontFamily: 'OpenSans-SemiBold'
                        )
                    )
                ),
                const Spacer(),
                const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: kBlack,
                    )
                )
              ],
            ),
          ),
        ),
        onTap: onPressed,
      )
  );
}