
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/DepartmentalGraduatesC.dart';

class DepartmentalGraduatesCNotifier with ChangeNotifier {
  List<DepartmentalGraduatesC> _departmentalGraduatesCList = [];
  DepartmentalGraduatesC _currentDepartmentalGraduatesC;

  UnmodifiableListView<DepartmentalGraduatesC> get departmentalGraduatesCList => UnmodifiableListView(_departmentalGraduatesCList);

  DepartmentalGraduatesC get currentDepartmentalGraduatesC => _currentDepartmentalGraduatesC;

  set departmentalGraduatesCList(List<DepartmentalGraduatesC> departmentalGraduatesCList) {
    _departmentalGraduatesCList = departmentalGraduatesCList;
    notifyListeners();
  }

  set currentDepartmentalGraduatesC(DepartmentalGraduatesC departmentalGraduatesC) {
    _currentDepartmentalGraduatesC = departmentalGraduatesC;
    notifyListeners();
  }

}