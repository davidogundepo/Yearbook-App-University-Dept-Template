
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/DepartmentalGraduatesB.dart';
import '../notifier/departmental_graduates_b_notifier.dart';

getDepartmentalGraduatesB(DepartmentalGraduatesBNotifier departmentalGraduatesBNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('DepartmentGraduatesB').orderBy("name").getDocuments();

  List<DepartmentalGraduatesB> _departmentalGraduatesBList = [];

  snapshot.documents.forEach((document) {
    DepartmentalGraduatesB departmentalGraduatesB = DepartmentalGraduatesB.fromMap(document.data);
    _departmentalGraduatesBList.add(departmentalGraduatesB);
  });

  departmentalGraduatesBNotifier.departmentalGraduatesBList = _departmentalGraduatesBList;
}