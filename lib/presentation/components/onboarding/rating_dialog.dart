import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:heart_rate_bpm_meter/data/ui-settings/colors_palette.dart';


class RateMyApp extends StatelessWidget {
  const RateMyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _textStyle = TextStyle(
        color: CupertinoColors.systemBlue,
        fontSize: 15.0,
        fontFamily: 'OpenSans-Bold',
        fontWeight: FontWeight.bold);
    return Theme(
        data: ThemeData.light(),
        child: CupertinoAlertDialog(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset('assets/icons/appIcon.png'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 5),
                child: Text(
                  'Please rate the app',
                  style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: kBlack),
                ),
              ),
            ],
          ),
          content: const Text(
            'Tap a star to rate. You can also leave a \ncomment ',
            textAlign: TextAlign.center,
            overflow: TextOverflow.fade,
            style: TextStyle(
                fontFamily: 'OpenSans-Regular',
                fontSize: 11,
                color: kBlack),
          ),
          actions: [
            CupertinoDialogAction(
                child: RatingBarIndicator(
                  rating: 4.0,
                  itemCount: 5,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.5),
                      child: Icon(
                        index == 4 ? Icons.star_border_outlined : Icons.star_rounded,
                        size: 24.0,
                        color: CupertinoColors.systemBlue,
                      )),
                )),
            CupertinoDialogAction(
                isDefaultAction: false,
                child: TextButton(
                  child: const Text(
                    'Cancel',
                    style: _textStyle,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
            CupertinoDialogAction(
                isDefaultAction: true,
                child: TextButton(
                  child: const Text(
                    'Submit',
                    style: _textStyle,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ))
          ],
        )
    );
  }
}