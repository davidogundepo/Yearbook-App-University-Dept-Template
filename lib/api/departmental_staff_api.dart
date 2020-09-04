
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/DepartmentalStaff.dart';
import '../notifier/departmental_staff_notifier.dart';

getDepartmentalStaff(DepartmentalStaffNotifier departmentalStaffNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('DepartmentalStaff').orderBy("id").getDocuments();

  List<DepartmentalStaff> _departmentalStaffList = [];

  snapshot.documents.forEach((document) {
    DepartmentalStaff departmentalStaff = DepartmentalStaff.fromMap(document.data);
    _departmentalStaffList.add(departmentalStaff);
  });

  departmentalStaffNotifier.departmentalStaffList = _departmentalStaffList;
}