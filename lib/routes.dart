import 'package:flutter/cupertino.dart';
import 'package:heart_rate_bpm_meter/presentation/home.dart';
import 'package:heart_rate_bpm_meter/presentation/screens/measurement/result_screen.dart';
import 'package:heart_rate_bpm_meter/presentation/screens/onboarding/on_boarding.dart';

var routes = {
  '/onboarding': (BuildContext context) => const OnBoardingScreen(),
  '/': (BuildContext context) => const HomePage(),
  '/result': (BuildContext context) => const ResultScreen(),
};