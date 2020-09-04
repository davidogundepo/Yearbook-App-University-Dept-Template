
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/DepartmentalGraduatesA.dart';

class DepartmentalGraduatesANotifier with ChangeNotifier {
  List<DepartmentalGraduatesA> _departmentalGraduatesAList = [];
  DepartmentalGraduatesA _currentDepartmentalGraduatesA;

  UnmodifiableListView<DepartmentalGraduatesA> get departmentalGraduatesAList => UnmodifiableListView(_departmentalGraduatesAList);

  DepartmentalGraduatesA get currentDepartmentalGraduatesA => _currentDepartmentalGraduatesA;

  set departmentalGraduatesAList(List<DepartmentalGraduatesA> departmentalGraduatesAList) {
    _departmentalGraduatesAList = departmentalGraduatesAList;
    notifyListeners();
  }

  set currentDepartmentalGraduatesA(DepartmentalGraduatesA departmentalGraduatesA) {
    _currentDepartmentalGraduatesA = departmentalGraduatesA;
    notifyListeners();
  }

}