
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/Achievements.dart';
import '../notifier/achievement_images_notifier.dart';

getAchievements(AchievementsNotifier achievementsNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('AchievementImages').getDocuments();

  List<Achievements> _achievementsList = [];

  snapshot.documents.forEach((document) {
    Achievements achievements = Achievements.fromMap(document.data);
    _achievementsList.add(achievements);
  });

  achievementsNotifier.achievementsList = _achievementsList;
}