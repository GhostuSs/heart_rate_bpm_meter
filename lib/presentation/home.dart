import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';
import 'package:heart_rate_bpm_meter/presentation/screens/measurement/start_screen.dart';
import 'package:heart_rate_bpm_meter/presentation/screens/settings/settings.dart';
import 'package:heart_rate_bpm_meter/presentation/screens/statistics/statistics_screen.dart';

import 'components/home/btm_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}
class _HomePage extends State<HomePage> {
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: kWhite,
      tabBar: btmNavBar(selectedIndex),
      tabBuilder: (BuildContext context, _selectedIndex){
        List pages = [
          const StatisticsScreen(),
          const StartScreen(),
          const SettingsScreen(),
        ];
        return CupertinoTabView(
            builder:(context){
                  return pages[_selectedIndex];
            }
        );
      },
    );
  }
}