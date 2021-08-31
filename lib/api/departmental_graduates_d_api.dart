
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/DepartmentalGraduatesD.dart';
import '../notifier/departmental_graduates_d_notifier.dart';

getDepartmentalGraduatesD(DepartmentalGraduatesDNotifier departmentalGraduatesDNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('DepartmentGraduatesD').orderBy("name").get();

  List<DepartmentalGraduatesD> _departmentalGraduatesDList = [];

  snapshot.docs.forEach((document) {
    DepartmentalGraduatesD departmentalGraduatesD = DepartmentalGraduatesD.fromMap(document.data());
    _departmentalGraduatesDList.add(departmentalGraduatesD);
  });

  departmentalGraduatesDNotifier.departmentalGraduatesDList = _departmentalGraduatesDList;
}