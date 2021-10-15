// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';

CupertinoTabBar btmNavBar(int selectedIndex) {
  return CupertinoTabBar(
    backgroundColor: kDarkGray.withOpacity(0.1),
    activeColor: kRed,
    inactiveColor: kDarkGray,
    currentIndex: selectedIndex,
    border: Border(top: BorderSide(width: 0.5,color: kDarkGray.withOpacity(0.94))),
    items: [
      BottomNavigationBarItem(
          icon: StatBtn(kDarkGray),
          label: 'Statistics',
          activeIcon: StatBtn(kRed)
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

class StatBtn extends StatelessWidget{
  final Color color;
  StatBtn(this.color);
  @override
  build(BuildContext context) {
    return Center(
      child: Container(
        width: 25,
        height: 25,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 3,
              height: 13,
              color: color,
            ),
            SizedBox(width: 6),
            Container(
              width: 3,
              height: 19.5,
              color: color,
            ),
            SizedBox(width: 6),
            Container(
              width: 3,
              height: 24,
              color: color,
            )
          ],
        ),
      ),
    );
  }
}
