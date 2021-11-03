import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/data.dart';
import 'package:heart_rate_bpm_meter/data/pulse_worker.dart';
import 'package:heart_rate_bpm_meter/presentation/components/measurement/start_button.dart';
import 'package:heart_rate_bpm_meter/presentation/screens/measurement/result_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/src/provider.dart';

class StartScreen extends StatefulWidget{
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StartScreen();
  }
}

class _StartScreen extends State<StartScreen>{
  bool started=false;
  int rate=0;
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body:  Column(
        children:[
          Padding(
            padding: EdgeInsets.only(top: height*0.1,bottom: height*0.2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Measurement',
                  style: TextStyle(
                    fontFamily:'OpenSans-SemiBold',
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),


                )
              ],
            ),
          ),
          StartButton(onPressed: onPressed,flag: started,label: rate),
          SizedBox(height: height*0.03),
          Visibility(
            visible: !started,
              child: const Text(
            'Tap to measure',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'OpenSans-Regular'
            ),
          ),
          )
        ],
      ),
    );
  }
onPressed() async {
  PulseWorker pulse = PulseWorker();
  final suffix = context.read<Data>();
  var measuring=Timer.periodic(const Duration(seconds: 1), (timer) async {
    if (timer.tick == 15 && started) {
      timer.cancel();
      await pulse.stop();
      Navigator.push(context, PageTransition(
          child: const ResultScreen(), type: PageTransitionType.rightToLeft));
    }
    else {
      suffix.measurePoints.add(await pulse.current() ?? 0);
    }
    setState(() {
      rate = suffix.measurePoints.last;
    });
  });
  if (!started) {
    setState(() {
      started = true;
    });
    await pulse.start();
    measuring;
  }else{
    await pulse.stop();
    measuring.cancel();
    setState(() {
      started=false;
    });
    suffix.measurePoints=[];
  }
}
}