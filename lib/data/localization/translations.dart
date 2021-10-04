import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:get/get.dart';
import 'constants.dart';

class Translator extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'ru_Ru' : {
      'title' : titleRu,
      'subtitle': subtitleRu,
      'Russian':languagesRu[0],
      'English':languagesRu[1],
      'Ukrainian':languagesRu[2]
    },
    'en_US' : {
      'title' : titleEn,
      'subtitle': subtitleEn,
      'Russian':languagesEn[0],
      'English':languagesEn[1],
      'Ukrainian':languagesEn[2]
    },
    'uk_UA' : {
      'title' : 'Заголовок',
      'subtitle': 'Підзаголовок',
      'Russian':languagesUa[0],
      'English':languagesUa[1],
      'Ukrainian':languagesUa[2]
    }
  };

}