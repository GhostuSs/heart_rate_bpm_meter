import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/ui-settings/colors_palette.dart';

bool seen=false;
Future<void> main() async {
  //SharedPreferences prefs = await SharedPreferences.getInstance();
  //seen = prefs.getBool("onboarding") ?? false;
 // await prefs.setBool("onboarding", true);
  runApp(
      MaterialApp(
        color: kWhite,
          debugShowCheckedModeBanner: false,
          initialRoute: seen ? '/' : "/onboarding" ,
          routes: routes
      )
  );
}