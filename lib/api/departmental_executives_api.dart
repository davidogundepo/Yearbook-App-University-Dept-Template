
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/DepartmentalExecutives.dart';
import '../notifier/departmental_executives_notifier.dart';

getDepartmentalExecutives(DepartmentalExecutivesNotifier departmentalExecutivesNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance
      .collection('DepartmentalExecutives').orderBy("name").getDocuments();

  List<DepartmentalExecutives> _departmentalExecutivesList = [];

  snapshot.documents.forEach((document) {
    DepartmentalExecutives departmentalExecutives = DepartmentalExecutives.fromMap(document.data);
    _departmentalExecutivesList.add(departmentalExecutives);
  });

  departmentalExecutivesNotifier.departmentalExecutivesList = _departmentalExecutivesList;
}