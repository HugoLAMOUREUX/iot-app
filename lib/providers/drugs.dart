import 'dart:io';

import 'package:flutter/material.dart';

import '../models/drug_model.dart';

class Drugs extends ChangeNotifier {
  List<DrugModel> _drugs = [];

  void addDrug(DrugModel drug) {
    _drugs.add(drug);
    notifyListeners();
  }

  List<DrugModel> get drugs => _drugs;
}
