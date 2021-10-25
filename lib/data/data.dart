import 'dart:math';

class Data{
  List<int> measurePoints=List.empty(growable: true);
  String? dateOfMeasure='';
  double  feelings=0;
  Data({this.dateOfMeasure,required this.measurePoints});
  average(){
    int sum = measurePoints.fold(0, (previous, current) => previous + current);
    return (sum/measurePoints.length).round();
  }
  maximal(){
    return measurePoints.reduce(max);
  }
  minimal(){
    return measurePoints.reduce(min);
  }
  removeData(){
    measurePoints=[];
    dateOfMeasure='';
  }
  Map<String,dynamic> toJson(){
    return{
      'dateOfMeasure':dateOfMeasure,
      'measurePoints':measurePoints,
    };
  }
  Data.fromJson(Map<String,dynamic> json){
    dateOfMeasure=json['dateOfMeasure'];
    measurePoints=json['measurePoints'];
  }
  fromJson(Map<String,dynamic> json){
    dateOfMeasure=json['dateOfMeasure'];
    measurePoints=json['measurePoints'];
  }
}

