import 'package:flutter/material.dart';

class NewDrugData extends ChangeNotifier {
  List<String> _days = [];
  int _hour = 0;
  int _minute = 0;
  String _name = '';

  void addDay(String day) {
    _days.add(day);
    print(_days);
    notifyListeners();
  }

  void removeDay(String day) {
    _days.remove(day);
    print(_days);
    notifyListeners();
  }

  List<String> get days => _days;
  int get hour => _hour;
  int get minute => _minute;
  String get name => _name;

  set days(List<String> days) {
    _days = days;
    notifyListeners();
  }

  set hour(int hour) {
    _hour = hour;
    notifyListeners();
  }

  set minute(int minute) {
    _minute = minute;
    notifyListeners();
  }

  set name(String name) {
    _name = name;
    notifyListeners();
  }
}
