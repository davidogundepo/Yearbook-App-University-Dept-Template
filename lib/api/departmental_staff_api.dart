
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/DepartmentalStaff.dart';
import '../notifier/departmental_staff_notifier.dart';

getDepartmentalStaff(DepartmentalStaffNotifier departmentalStaffNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('DepartmentalStaff').orderBy("id").get();

  List<DepartmentalStaff> _departmentalStaffList = [];

  snapshot.docs.forEach((document) {
    DepartmentalStaff departmentalStaff = DepartmentalStaff.fromMap(document.data());
    _departmentalStaffList.add(departmentalStaff);
  });

  departmentalStaffNotifier.departmentalStaffList = _departmentalStaffList;
}