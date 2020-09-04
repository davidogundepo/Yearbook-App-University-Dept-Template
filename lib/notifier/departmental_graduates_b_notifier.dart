
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/DepartmentalGraduatesB.dart';

class DepartmentalGraduatesBNotifier with ChangeNotifier {
  List<DepartmentalGraduatesB> _departmentalGraduatesBList = [];
  DepartmentalGraduatesB _currentDepartmentalGraduatesB;

  UnmodifiableListView<DepartmentalGraduatesB> get departmentalGraduatesBList => UnmodifiableListView(_departmentalGraduatesBList);

  DepartmentalGraduatesB get currentDepartmentalGraduatesB => _currentDepartmentalGraduatesB;

  set departmentalGraduatesBList(List<DepartmentalGraduatesB> departmentalGraduatesBList) {
    _departmentalGraduatesBList = departmentalGraduatesBList;
    notifyListeners();
  }

  set currentDepartmentalGraduatesB(DepartmentalGraduatesB departmentalGraduatesB) {
    _currentDepartmentalGraduatesB = departmentalGraduatesB;
    notifyListeners();
  }

}