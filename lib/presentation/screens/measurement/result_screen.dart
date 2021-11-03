import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/data.dart';
import 'package:heart_rate_bpm_meter/data/history.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';
import 'package:heart_rate_bpm_meter/presentation/components/measurement/result_card.dart';
import 'package:heart_rate_bpm_meter/presentation/screens/measurement/start_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/src/provider.dart';

class ResultScreen extends StatefulWidget{
  const ResultScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ResultScreen();
  }
}

class _ResultScreen extends State<ResultScreen>{
  @override
  void initState() {
    DateTime dateTime = DateTime.now();
    String currentDateTime='${dateTime.day}.'+(dateTime.month<DateTime.october?'0':'')+'${dateTime.month}.${dateTime.year}, ${dateTime.hour}:'+(dateTime.minute<10?'0':'')+'${dateTime.minute}';
    context.read<Data>().dateOfMeasure=currentDateTime;
    super.initState();
  }
  double sliderValue=0;
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: kWhite,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: height*0.08),
          child: btn(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height*0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Result',
                    style: TextStyle(
                      fontFamily:'OpenSans-SemiBold',
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),


                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height*0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '${context.read<Data>().average()}',
                    style: const TextStyle(
                      color: kRed,
                      fontFamily: 'OpenSans-Regular',
                      fontWeight: FontWeight.w700,
                      fontSize: 46,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'Bpm',
                    style: TextStyle(
                      color: kDarkGray,
                      fontFamily: 'OpenSans-Regular',
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  )
                ]
            )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RawCard(context.read<Data>().average(),'Average'),
                  RawCard(context.read<Data>().maximal(),'Max')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'How do you feel yourself?',
                    style: TextStyle(
                        color: kBlack,
                        fontFamily: 'OpenSans-Regular',
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                    ),
                  ),
                ],
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: sliderValue<80 ? 15.0 : sliderValue*0.2),
              ),
              child: Slider(
                value: sliderValue,
                inactiveColor: kDarkGray,
                activeColor: kRed,
                min: 0,
                max: 100,
                thumbColor: kRed,
                onChanged:(value){
                  sliderValue=value;
                  setState(() {
                    context.read<Data>().feelings=sliderValue.roundToDouble();
                  });
                },
              ),
            )
          ],
        )
    );
  }
  Widget btn(){
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 20),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: kRed,
            borderRadius: BorderRadius.circular(8.0)
        ),
        child: InkWell(
            child: const Center(
              child: Text(
                'Save',
                style: TextStyle(
                  color: kWhite,
                  fontSize: 18.0,
                  fontFamily: 'OpenSans-Bold',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            splashColor: kRed,
            highlightColor: kRed,
            onTap:onPressed),
      ),
    );
  }
  onPressed() async {
    await addList(context.read<Data>());
    Navigator.push(context,PageTransition(
        child: const StartScreen(), type: PageTransitionType.rightToLeft));
  }
}
