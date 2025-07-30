import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceSaver{

  static void saveNewTraining(String name, String type, String repeats) async{
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    List<dynamic> data = jsonDecode(_prefs.getString("trains")?? "[]");
    DateTime dt = DateTime.now();

    String hour = dt.hour.toString();
    String minute = dt.minute.toString();
    String day = dt.day.toString();
    String month = dt.month.toString();
    String year = dt.year.toString();

    String tts = "$hour:$minute";
    String dts = "$day.$month.$year";
    String tdts = "$tts $dts";

    data.add({
      "name": name,
      "type": type,
      "repeats": repeats,
      "time": tdts
    });
    await _prefs.setString("trains", jsonEncode(data));
    if (kDebugMode) {
      print(_prefs.get("trains"));
    }
  }

  static Future<List<dynamic>> getTrainings() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> data = jsonDecode(prefs.getString("trains")?? "[]");
    return data;
  }

  static Map<String, dynamic> getTrainingById(int id, List<dynamic> data){
    return data[id];
  }

  static String getName(Map<String, dynamic> training){
    return training["name"];
  }

  static String getType(Map<String, dynamic> training){
    return training["type"];
  }

  static String getRepeats(Map<String, dynamic> training){
    return training["repeats"];
  }

  static String getTime(Map<String, dynamic> training) {
    return training["time"];
  }

  static Future<void> resetAllData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("trains");
  }



  static int getLength(List<dynamic> data) {
    return data.length;
  }
}



