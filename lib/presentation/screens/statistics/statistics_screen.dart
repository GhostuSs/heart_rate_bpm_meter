
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/history.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';
import 'package:provider/src/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _StatisticsScreen();
  }
}

class _StatisticsScreen extends State<StatisticsScreen> {
  List<Widget>? historyList;
  late List<PulseData> _chartData;
  @override
  void initState() {
    _chartData=getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.07),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Statistics',
                    style: TextStyle(
                        color: kBlack,
                        fontFamily: 'OpenSans-Regular',
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ), // label
                ],
              ),
            ),
            const SizedBox(height: 15),
            const RawSegmented(), //segmented
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: height*0.25,
              child: SfCartesianChart(
                  enableAxisAnimation: true,
                  series: <ChartSeries>[
                LineSeries<PulseData,double>(
                    color: kRed,
                    width:3,
                    xValueMapper: (PulseData data, _) =>data.day,
                    yValueMapper: (PulseData data, _) => data.pulseValue,
                    dataSource: _chartData)
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: kDarkGray.withOpacity(0.3),
                        blurRadius: 30.0,
                        spreadRadius: 0.3,

                      )
                    ]
                ),
                child: Center(
                    child:Column(
                      children: const [
                        Text(
                          'Average value:',
                          style: TextStyle(
                              color: kBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'OpenSans-Regular'
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'You felt great most of the time',
                          style: TextStyle(
                              color: kRed,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'OpenSans-Regular'
                          ),
                        ) ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Row(
                children: const [
                  Text(
                    'History:',
                    style: TextStyle(
                        color: kBlack,
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'OpenSans-Regular'
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: height*0.3,
              child: ListView.builder(
                itemBuilder: (context,index)=>HistoryCard(index),
                itemCount: context.read<HistoryList>().dataList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
  List<PulseData> getChartData(){
    List<PulseData> chartData = [
      PulseData(1, 50),
      PulseData(2, 75),
      PulseData(3, 20),
      PulseData(4, 100),
      PulseData(5, 73),
      PulseData(6, 60),
    ];
    return chartData;
  }
}

class PulseData{
  final double day;
  final double pulseValue;
  PulseData(this.day,this.pulseValue);
}

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
        height: 50,
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

class HistoryCard extends StatefulWidget {
  final int index;
  HistoryCard(this.index);
  @override
  State<StatefulWidget> createState() {
    return _HistoryCard();
  }
}

class _HistoryCard extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kWhite,
              boxShadow: [
                BoxShadow(
                  color: kDarkGray.withOpacity(0.3),
                  blurRadius: 30.0,
                  spreadRadius: 0.3,

                )
              ]
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Text(
                        '${context.read<HistoryList>().dataList[widget.index].dateOfMeasure}',
                        style: const TextStyle(
                            color: kBlack,
                            fontFamily: 'OpenSans-Regular',
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                        ),
                    ),
                  ],
                ),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/icons/heart.png'),
                      const SizedBox(width: 10),
                      Text(
                        '${context.read<HistoryList>().dataList[widget.index].average()}',
                        style: const TextStyle(
                            color: kBlack,
                            fontFamily: 'OpenSans-Regular',
                            fontWeight: FontWeight.w600,
                            fontSize: 38
                        ),
                      ),
                      const SizedBox(width: 10),
                      Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            'Bpm',
                            style: TextStyle(
                                color: kDarkGray.withOpacity(0.5),
                                fontFamily: 'OpenSans-Regular',
                                fontWeight: FontWeight.w600,
                                fontSize: 16
                            ),
                          )
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: kRed,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 50),
                    child: Center(
                        child: Text(
                            ' ${context.read<HistoryList>().dataList.first.feelings.round()}% ',
                          style: const TextStyle(
                            color: kWhite,
                            fontSize: 16,
                            fontFamily: 'OpenSans-Regular',
                            fontWeight: FontWeight.w500
                          ),
                        )
                    ),
                  ),

                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(color: kDarkGray),
              )
            ],
          )
      ),
    );
  }
}
