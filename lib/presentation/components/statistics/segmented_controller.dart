import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';

class RawSegmented extends StatefulWidget {
  const RawSegmented({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RawSegmented();
  }
}

class _RawSegmented extends State<RawSegmented> {
  var segmentedControlValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: CupertinoSlidingSegmentedControl(
          groupValue: segmentedControlValue,
          backgroundColor: kWhite,
          thumbColor: kRed,
          children: <int, Widget>{
            0: Tab(label: 'Week', index: 0,isSelectedIndex: segmentedControlValue),
            1: Tab(label: 'Month', index: 1,isSelectedIndex: segmentedControlValue),
            2: Tab(label: 'Year', index: 2,isSelectedIndex: segmentedControlValue),
          },
          onValueChanged: (int? value) {
            setState(() {
              segmentedControlValue = value!;
            });
          }),
    );
  }
}

class Tab extends StatelessWidget {
  final String label;
  final int index;
  final isSelectedIndex;
  Tab({Key? key, required this.label, required this.index,required this.isSelectedIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 38,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                color: index!=isSelectedIndex ? kDarkGray : kWhite,
                fontFamily: 'OpenSans-Regular',
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
        ));
  }
}