
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/DepartmentalGraduatesA.dart';
import '../notifier/departmental_graduates_a_notifier.dart';

getDepartmentalGraduatesA(DepartmentalGraduatesANotifier departmentalGraduatesANotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('DepartmentGraduatesA').orderBy("name").get();

  List<DepartmentalGraduatesA> _departmentalGraduatesAList = [];

  snapshot.docs.forEach((document) {
    DepartmentalGraduatesA departmentalGraduatesA = DepartmentalGraduatesA.fromMap(document.data());
    _departmentalGraduatesAList.add(departmentalGraduatesA);
  });

  departmentalGraduatesANotifier.departmentalGraduatesAList = _departmentalGraduatesAList;
}