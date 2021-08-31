
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/DepartmentalExecutives.dart';
import '../notifier/departmental_executives_notifier.dart';

getDepartmentalExecutives(DepartmentalExecutivesNotifier departmentalExecutivesNotifier) async{
  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('DepartmentalExecutives').orderBy("id").get();

  List<DepartmentalExecutives> _departmentalExecutivesList = [];

  snapshot.docs.forEach((document) {
    DepartmentalExecutives departmentalExecutives = DepartmentalExecutives.fromMap(document.data());
    _departmentalExecutivesList.add(departmentalExecutives);
  });

  departmentalExecutivesNotifier.departmentalExecutivesList = _departmentalExecutivesList;
}