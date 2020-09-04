
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/DepartmentalExecutives.dart';

class DepartmentalExecutivesNotifier with ChangeNotifier {
  List<DepartmentalExecutives> _departmentalExecutivesList = [];
  DepartmentalExecutives _currentDepartmentalExecutives;

  UnmodifiableListView<DepartmentalExecutives> get departmentalExecutivesList => UnmodifiableListView(_departmentalExecutivesList);

  DepartmentalExecutives get currentDepartmentalExecutives => _currentDepartmentalExecutives;

  set departmentalExecutivesList(List<DepartmentalExecutives> departmentalExecutivesList) {
    _departmentalExecutivesList = departmentalExecutivesList;
    notifyListeners();
  }

  set currentDepartmentalExecutives(DepartmentalExecutives departmentalExecutives) {
    _currentDepartmentalExecutives = departmentalExecutives;
    notifyListeners();
  }

}