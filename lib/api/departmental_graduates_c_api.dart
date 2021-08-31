
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/DepartmentalGraduatesC.dart';
import '../notifier/departmental_graduates_c_notifier.dart';

getDepartmentalGraduatesC(DepartmentalGraduatesCNotifier departmentalGraduatesCNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('DepartmentGraduatesC').orderBy("name").get();

  List<DepartmentalGraduatesC> _departmentalGraduatesCList = [];

  snapshot.docs.forEach((document) {
    DepartmentalGraduatesC departmentalGraduatesC = DepartmentalGraduatesC.fromMap(document.data());
    _departmentalGraduatesCList.add(departmentalGraduatesC);
  });

  departmentalGraduatesCNotifier.departmentalGraduatesCList = _departmentalGraduatesCList;
}