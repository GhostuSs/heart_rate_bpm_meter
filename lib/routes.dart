import 'package:flutter/cupertino.dart';
import 'package:heart_rate_bpm_meter/presentation/home.dart';
import 'package:heart_rate_bpm_meter/presentation/screens/onboarding/on_boarding.dart';

var routes = {
  '/onboarding': (BuildContext context) => const OnBoardingScreen(),
  '/': (BuildContext context) => const HomePage(),
};