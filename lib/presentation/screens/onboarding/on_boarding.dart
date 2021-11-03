import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/onboarding/slider_model.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';
import 'package:heart_rate_bpm_meter/presentation/components/onboarding/rating_dialog.dart';
import 'package:heart_rate_bpm_meter/presentation/components/onboarding/slider_tile.dart';

class OnBoardingScreen extends StatefulWidget{
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OnBoardingScreen();
  }

}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  List<SliderModel> slides = List.empty(growable: true);
  int currentIndex = 0;
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    slides = getSlides();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: PageView.builder(
          controller: pageController,
          itemCount: slides.length,
          onPageChanged: (val)=>setState((){currentIndex=val;}),
          itemBuilder: (context,index){
            return SliderTile(
              flag: index == slides.length-2 || index ==slides.length-1 ? true : false,
              widget: slides[index].widget,
              title: slides[index].title,
              desc: slides[index].desc,
            );
          }
      ),
      floatingActionButton: currentIndex != slides.length-1 ? floatingBtm(false,'Continue',onContinue) : floatingBtm(true,'Start FREE',onStartFree),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  Future<void> onContinue() async {
    if (currentIndex==1) await showDialog(context: context,builder: (context)=>const RateMyApp());
    setState(() {
      currentIndex++;
      pageController.animateToPage(
          currentIndex, duration: const Duration(milliseconds: 300),
          curve: Curves.linear);
    });
  }
  void onStartFree(){
    Navigator.pushNamed(context, '/');
  }
  Widget floatingBtm(bool isLast,String text,onPressed){
    return Container(
        decoration: const BoxDecoration(
          color: kWhite,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:10.0),
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                    color: kRed,
                    borderRadius: BorderRadius.circular(8.0)
                ),
                child: InkWell(
                    child: Center(
                      child: Text(
                        text,
                        style: const TextStyle(
                          color: kWhite,
                          fontSize: 16.0,
                          fontFamily: 'OpenSans-Bold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    splashColor: kRed,
                    highlightColor: kRed,
                    onTap:onPressed),
              ),
            ),
            isLast
                ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                              color: kBlack,
                              fontFamily: 'OpenSans-Regular',
                              fontSize: 12.0
                          ),
                        ),
                        onTap: ()=>{},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: 16,
                          width: 1,
                          color: kBlack,
                        ),
                      ),
                      InkWell(
                        child: const Text(
                          'Terms of Use',
                          style: TextStyle(
                              color: kBlack,
                              fontFamily: 'OpenSans-Regular',
                              fontSize: 12.0
                          ),
                        ),
                        onTap: ()=>{},
                      )
                    ]
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: InkWell(
                    child: const Text(
                      'Restore purchases',
                      style: TextStyle(
                          color: kBlack,
                          fontFamily: 'OpenSans-Regular',
                          fontSize: 14.0
                      ),
                    ),
                    onTap: ()=>{},
                  ),
                )
              ],
            )
                :const Text(''),
            SizedBox(height: isLast
                ? MediaQuery.of(context).size.height*0.0175
                : MediaQuery.of(context).size.height*0.049)
          ],
        )
    );
  }
}
