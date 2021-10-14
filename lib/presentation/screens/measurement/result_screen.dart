import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/data.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';
import 'package:heart_rate_bpm_meter/presentation/components/measurement/result_card.dart';
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
    //addThis();
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
                      fontSize: 24,
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
                      fontSize: 48,
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'Bpm',
                    style: TextStyle(
                      color: kDarkGray,
                      fontFamily: 'OpenSans-Regular',
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
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
                        fontSize: 20
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
                    print(sliderValue);
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: double.infinity,
        height: 56,
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
  onPressed(){

  }
  addThis() async {
    //await addList(context.read<Data>());
  }
}

