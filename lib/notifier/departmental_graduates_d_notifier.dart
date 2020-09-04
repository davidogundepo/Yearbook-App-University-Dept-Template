
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/DepartmentalGraduatesD.dart';

class DepartmentalGraduatesDNotifier with ChangeNotifier {
  List<DepartmentalGraduatesD> _departmentalGraduatesDList = [];
  DepartmentalGraduatesD _currentDepartmentalGraduatesD;

  UnmodifiableListView<DepartmentalGraduatesD> get departmentalGraduatesDList => UnmodifiableListView(_departmentalGraduatesDList);

  DepartmentalGraduatesD get currentDepartmentalGraduatesD => _currentDepartmentalGraduatesD;

  set departmentalGraduatesDList(List<DepartmentalGraduatesD> departmentalGraduatesDList) {
    _departmentalGraduatesDList = departmentalGraduatesDList;
    notifyListeners();
  }

  set currentDepartmentalGraduatesD(DepartmentalGraduatesD departmentalGraduatesD) {
    _currentDepartmentalGraduatesD = departmentalGraduatesD;
    notifyListeners();
  }

}