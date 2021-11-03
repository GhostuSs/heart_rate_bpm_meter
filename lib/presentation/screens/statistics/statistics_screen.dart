import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/data.dart';
import 'package:heart_rate_bpm_meter/data/history.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';
import 'package:heart_rate_bpm_meter/presentation/components/statistics/segmented_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _StatisticsScreen();
  }
}

class _StatisticsScreen extends State<StatisticsScreen> {
  @override
  void initState(){
    setState((){});
    super.initState();
  }
  List<Widget>? historyList;
  late List<Data> loadedList;
  late List<PulseData> _chartData;
  late SharedPreferences sharedPreferences;

  Future<bool> initSharedPreferences(BuildContext context) async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadedList = await getList();
    _chartData = getChartData();
    historyList = List.generate(
        loadedList.length, (index) => HistoryCard(index, loadedList[index]));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: FutureBuilder(
            future: initSharedPreferences(context),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: kRed,
                  ),
                );
              } else {
                return SingleChildScrollView(
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
                        height: height * 0.25,
                        child: SfCartesianChart(
                            enableAxisAnimation: true,
                            series: <ChartSeries>[
                              LineSeries<PulseData, double>(
                                  color: kRed,
                                  width: 3,
                                  xValueMapper: (PulseData data, _) => data.day,
                                  yValueMapper: (PulseData data, _) => data.pulseValue,
                                  dataSource: _chartData)
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
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
                              ]),
                          child: Center(
                              child: Column(
                            children: const [
                              Text(
                                'Average value:',
                                style: TextStyle(
                                    color: kBlack,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'OpenSans-Regular'),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'You felt great most of the time',
                                style: TextStyle(
                                    color: kRed,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'OpenSans-Regular'),
                              )
                            ],
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Row(
                          children: const [
                            Text(
                              'History:',
                              style: TextStyle(
                                  color: kBlack,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'OpenSans-Regular'),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.3,
                        child: ListView.builder(
                          itemBuilder: (context, index) =>
                              HistoryCard(index, loadedList),
                          itemCount: loadedList.length,
                        ),
                      )
                    ],
                  ),
                );
              }
            }));
  }

  List<PulseData> getChartData(){
    List<PulseData> chartData=[];
    for (int i = 0; i < loadedList.length; i++) {
      chartData.add(PulseData(i + 1, loadedList[i].feelings));
    }
    return chartData;
  }
}

class PulseData {
  final double day;
  final double pulseValue;
  PulseData(this.day, this.pulseValue);
}

class HistoryCard extends StatefulWidget {
  final data;
  final int index;
  HistoryCard(this.index, this.data);
  @override
  State<StatefulWidget> createState() {
    return _HistoryCard();
  }
}

class _HistoryCard extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              ]),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Text(
                      '${widget.data[widget.index].dateOfMeasure}',
                      style: const TextStyle(
                          color: kBlack,
                          fontFamily: 'OpenSans-Regular',
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
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
                        '${widget.data[widget.index].average()}',
                        style: const TextStyle(
                            color: kBlack,
                            fontFamily: 'OpenSans-Regular',
                            fontWeight: FontWeight.w600,
                            fontSize: 36),
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
                                fontSize: 14),
                          )),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: kRed, borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 35),
                    child: Center(
                        child: Text(
                          ' ${widget.data[widget.index].feelings.round()}% ',
                          style: const TextStyle(
                              color: kWhite,
                              fontSize: 14,
                              fontFamily: 'OpenSans-Regular',
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(color: kDarkGray),
              )
            ],
          )),
    );
  }
}
