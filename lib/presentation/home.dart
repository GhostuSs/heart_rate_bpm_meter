import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colorsPalette.dart';

import 'components/btmNavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}
class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: kWhite,
      tabBar: btmNavBar(_selectedIndex),
      tabBuilder: (BuildContext context, _selectedIndex){
        List pages = [
          Text('1'),
          Text('2'),
          Text('3'),
          Text('4')
        ];
        return CupertinoTabView(
            builder:(context){
              switch(_selectedIndex){
                case 1: {
                  return new Text('');
                }
                case 2:{
                  return new Text('');
                }
                default: {
                  return pages[_selectedIndex];
                }
              }
            }
        );
      },
    );
  }
}