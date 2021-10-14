import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/pulse_worker.dart';
import 'package:heart_rate_bpm_meter/presentation/components/measurement/start_button.dart';

class StartScreen extends StatefulWidget{
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StartScreen();
  }
}

class _StartScreen extends State<StartScreen>{
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
                    fontSize: 24,
                  ),


                )
              ],
            ),
          ),
          StartButton(onPressed: onPressed),
          SizedBox(height: height*0.03),
          const Text(
            'Tap to measure',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'OpenSans-Regular'
            ),
          )
        ],
      ),
    );
  }
onPressed() async {
    PulseWorker v=PulseWorker();
    int value=0;
    await v.start();
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      timer.tick==15 ? timer.cancel() : print(await v.current() ?? 0);
    });
    await v.stop();
}
}