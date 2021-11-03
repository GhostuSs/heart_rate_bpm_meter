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
    feelings=0;
  }
  Map<String,dynamic> toJson(){
    return{
      'dateOfMeasure':dateOfMeasure,
      'measurePoints':measurePoints,
      'feelings':feelings
    };
  }
  Data.fromJson(Map<String,dynamic> json){
    dateOfMeasure=json['dateOfMeasure'];
    measurePoints=json['measurePoints'].cast<int>();
    feelings=json['feelings'];
  }
  fromJson(Map<String,dynamic> json){
    dateOfMeasure=json['dateOfMeasure'];
    measurePoints=json['measurePoints'].cast<int>();
  }
}

