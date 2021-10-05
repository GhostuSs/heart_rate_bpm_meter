import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';

class SliderTile extends StatelessWidget {
  final String  title, desc;
  Widget widget;
  final bool flag;
  SliderTile(
      {required this.widget,
        required this.title,
        required this.desc,
        required this.flag});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Align(
          alignment: Alignment.topLeft,
          child: flag
              ? Padding(
            padding: EdgeInsets.only(
                left: 40, top: height * 0.065),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: kDarkGray,
                borderRadius: BorderRadius.circular(15)
              ),
              child: const Icon(
                CupertinoIcons.clear,
                color: kWhite,
                size: 24.0,
              ),
            ),
          )
              : const Text('')),
      Center(
        child: Container(
          color: kWhite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: height*0.2),
              AspectRatio(
                aspectRatio: 1.5,
                child: widget,
              ),
              SizedBox(height: height*0.01),
              Text(
                title,
                textAlign: TextAlign.justify,
                maxLines: 2,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    fontFamily: 'OpenSans-SemiBold',
                    color: kBlack),
              ),
              SizedBox(height: 12),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height*0.014),
                  child: Text(desc,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'OpenSans-SemiBold',
                          color: kBlack))),
              SizedBox(height: height * 0.2)
            ],
          ),
        ),
      ),
    ]);
  }
}