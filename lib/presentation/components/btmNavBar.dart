import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colorsPalette.dart';

CupertinoTabBar btmNavBar(int selectedIndex) {
  return CupertinoTabBar(
    backgroundColor: kLightGray.withOpacity(0.94),
    activeColor: kRed,
    inactiveColor: kLightGray.withOpacity(0.94),
    currentIndex: selectedIndex,
    border: Border(top: BorderSide(width: 10.0,color: kLightGray.withOpacity(0.94))),
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.speed,color: kDarkGray,size: 30),
          label: 'Statistics',
          activeIcon: Icon(Icons.speed,color: kRed,size: 30)
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.restore_rounded,color: kDarkGray,size: 30),
          label: 'Measurement',
          activeIcon: Icon(Icons.restore_rounded,color: kRed,size: 30)),
      BottomNavigationBarItem(
          icon: Icon(Icons.lock_outlined,color: kDarkGray,size: 30),
          label: 'Settings',
          activeIcon: Icon(Icons.lock_outlined,color: kRed,size: 30)),
    ],
  );
}