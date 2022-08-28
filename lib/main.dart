
import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './notifier/university_achievement_images_notifier.dart';
import './notifier/university_arial_images_notifier.dart';
import './notifier/sidebar_notifier.dart';
import 'package:provider/provider.dart';
import './notifier/achievement_images_notifier.dart';
import './notifier/departmental_graduates_a_notifier.dart';
import './notifier/departmental_graduates_b_notifier.dart';
import './notifier/departmental_graduates_c_notifier.dart';
import './notifier/departmental_graduates_d_notifier.dart';
import './notifier/departmental_staff_notifier.dart';
import './notifier/departmental_executives_notifier.dart';

import './sidebar/sidebar_layout.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runZonedGuarded(() {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DepartmentalGraduatesANotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => DepartmentalGraduatesBNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => DepartmentalGraduatesCNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => DepartmentalGraduatesDNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => DepartmentalExecutivesNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => DepartmentalStaffNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => AchievementsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => UniversityAchievementsNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => UniversityArialNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => SideBarNotifier(),
        ),

      ],
      child: MyApp(),
    ));
    }, FirebaseCrashlytics.instance.recordError
  );

}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: SideBarLayout(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}
