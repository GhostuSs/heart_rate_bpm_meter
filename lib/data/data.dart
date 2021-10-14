import 'dart:math';

class Data{
  List<int> measurePoints=[];
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
}