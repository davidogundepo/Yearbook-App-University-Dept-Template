
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/DepartmentalStaff.dart';

class DepartmentalStaffNotifier with ChangeNotifier {
  List<DepartmentalStaff> _departmentalStaffList = [];
  DepartmentalStaff _currentDepartmentalStaff;

  UnmodifiableListView<DepartmentalStaff> get departmentalStaffList => UnmodifiableListView(_departmentalStaffList);

  DepartmentalStaff get currentDepartmentalStaff => _currentDepartmentalStaff;

  set departmentalStaffList(List<DepartmentalStaff> departmentalStaffList) {
    _departmentalStaffList = departmentalStaffList;
    notifyListeners();
  }

  set currentDepartmentalStaff(DepartmentalStaff departmentalStaff) {
    _currentDepartmentalStaff = departmentalStaff;
    notifyListeners();
  }

}