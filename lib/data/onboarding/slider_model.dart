// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';

class SliderModel{
  Widget widget;
  String title;
  String desc;

  SliderModel({required this.widget,required this.title,required this.desc});
}

List<SliderModel> getSlides(){
  List<SliderModel> slides = List.empty(growable: true);
  slides.add(SliderModel(
      widget: Picture('assets/icons/follow.png'),
      title: 'Follow your rhythms',
      desc: 'Our main aim is to take care of your health'));
  slides.add(SliderModel(
      widget: Review(),
      title: 'Help us to improve the app',
      desc: 'We constantly monitor reviews and \nlisten to your opinion'));
  slides.add(SliderModel(
      widget: Picture('assets/icons/tip.png'),
      title: 'Pulsometer with health tips',
      desc: 'Gives health tips and full info \nabout your measures'));
  slides.add(SliderModel(
      widget: Picture('assets/icons/pocket.png'),
      title: 'Pocket healthcare app',
      desc: 'Subscribe to unlock all the features,\njust '+r'$'+'3.99/w '));
  slides.add(SliderModel(
      widget: Picture('assets/icons/pocket.png'),
      title: 'Pocket healthcare app',
      desc: 'FREE unlimited \naccess'));
  slides.add(SliderModel(
      widget: Picture('assets/icons/pocket.png'),
      title: 'Pocket healthcare app',
      desc: 'FREE unlimited \naccess'));
  return slides;
}

class Review extends StatelessWidget{
  const Review({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kBlack,width: 1.5)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Image.asset('assets/icons/avatar.png'),
                ),
                Row(
                    mainAxisSize: MainAxisSize.min,
                    children:[for(int i=0;i<6;i++)const Icon(CupertinoIcons.star_fill,color: kRed)]
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Such a great app! It takes only a few moments to measure and provides all needed info!',
              style: TextStyle(
                  fontFamily: 'OpenSans-Regular',
                  fontSize: 16,
                  fontWeight: FontWeight.w600
              ),
            ),

          ],
        ),
      )
    );
  }
}

class Picture extends StatelessWidget{
  final name;
  Picture(this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:AspectRatio(
        aspectRatio: 2/1.2,
        child: Center(child: Image.asset(name),
      )
    ));
  }
}