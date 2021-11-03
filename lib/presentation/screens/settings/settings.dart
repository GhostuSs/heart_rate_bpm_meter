import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';
import 'package:heart_rate_bpm_meter/presentation/components/settings/raw_card.dart';

class SettingsScreen extends StatefulWidget{
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingsScreen();
  }
}

class _SettingsScreen extends State<SettingsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 70,bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Measurement',
                      style: TextStyle(
                          color: kBlack,
                          fontSize: 30,
                          fontFamily: 'OpenSans-SemiBold',
                          fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                )
            ),
            rawCard('Terms of use',(){}),
            rawCard('Privacy policy',(){}),
            rawCard('Support',(){}),
          ],
        ),
      ),
    );
  }

}