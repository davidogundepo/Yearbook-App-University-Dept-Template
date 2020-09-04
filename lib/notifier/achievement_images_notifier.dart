
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import '../model/Achievements.dart';

class AchievementsNotifier with ChangeNotifier {
  List<Achievements> _achievementsList = [];
  Achievements _currentAchievements;

  UnmodifiableListView<Achievements> get achievementsList => UnmodifiableListView(_achievementsList);

  Achievements get currentAchievements => _currentAchievements;

  set achievementsList(List<Achievements> achievementsList) {
    _achievementsList = achievementsList;
    notifyListeners();
  }

  set currentAchievements(Achievements achievements) {
    _currentAchievements = achievements;
    notifyListeners();
  }

}