
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/DepartmentalGraduatesA.dart';
import '../notifier/departmental_graduates_a_notifier.dart';

getDepartmentalGraduatesA(DepartmentalGraduatesANotifier departmentalGraduatesANotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('DepartmentGraduatesA').orderBy("name").getDocuments();

  List<DepartmentalGraduatesA> _departmentalGraduatesAList = [];

  snapshot.documents.forEach((document) {
    DepartmentalGraduatesA departmentalGraduatesA = DepartmentalGraduatesA.fromMap(document.data);
    _departmentalGraduatesAList.add(departmentalGraduatesA);
  });

  departmentalGraduatesANotifier.departmentalGraduatesAList = _departmentalGraduatesAList;
}