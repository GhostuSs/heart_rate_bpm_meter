import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'data.dart';

class HistoryList {
  List<Data> dataList = List.empty(growable: true);
}
  clearList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  saveList(List<Data> gotList) async {
    List list = gotList;
    list = list.map((item) => json.encode(item)).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('history_key', list as List<String>);
    print('saved in func');
  }

  Future<List<Data>> getList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var gotList = prefs.getStringList('history_key');
    if (gotList != null) {
      print('got non-null list');
      List<Data> dataSet = List.empty(growable: true);
      for (int i = 0; i < gotList.length; i++) {
        Data item;
        item = Data.fromJson(json.decode(gotList[i]));
        dataSet.add(item);
      }
      return dataSet;
    } else {
      return [];
    }
  }

  addList(Data data) async {
    List<Data> list = await getList();
    list.add(data);
    for(int i=0;i<list.length;i++){
      print(list[i].measurePoints);
    }
    await saveList(list);
  }

  removeLast() async {
    List<Data> list = await getList();
    list.removeLast();
    await saveList(list);
  }