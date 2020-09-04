
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/DepartmentalGraduatesC.dart';
import '../notifier/departmental_graduates_c_notifier.dart';

getDepartmentalGraduatesC(DepartmentalGraduatesCNotifier departmentalGraduatesCNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('DepartmentGraduatesC').orderBy("name").getDocuments();

  List<DepartmentalGraduatesC> _departmentalGraduatesCList = [];

  snapshot.documents.forEach((document) {
    DepartmentalGraduatesC departmentalGraduatesC = DepartmentalGraduatesC.fromMap(document.data);
    _departmentalGraduatesCList.add(departmentalGraduatesC);
  });

  departmentalGraduatesCNotifier.departmentalGraduatesCList = _departmentalGraduatesCList;
}