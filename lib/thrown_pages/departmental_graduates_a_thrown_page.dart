import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../about_menu_details_pages/about_app.dart';
import '../about_menu_details_pages/about_department.dart';
import '../about_menu_details_pages/about_university.dart';
import '../about_menu_details_pages/acronyms_meanings.dart';
import '../about_menu_details_pages/who_we_are.dart';
import '../api/departmental_graduates_a_api.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../details_pages/departmental_graduates_a_details_page.dart';
import '../notifier/departmental_graduates_a_notifier.dart';
import '../thrown_searches/departmental_graduates_a_thrown_search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';


String universityName = "University of Benin";
String departmentName = "Economics Department";
String stateName = "Rivers State";
String countryName = "Nigeria";
String thrownName = "Economics Graduates Class A";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";


String whoWeAre = "Who We Are";
String aboutDepartment = "About $departmentName";
String aboutUniversity = "About $universityName 2021";
String acronymMeanings = "Acronym Meanings";
String aboutApp = "About App";

String imgAsset = "assets/images/uni_studs_2.jpg";

String networkSharedPreferencesKey = "first_time";
String networkSharedPreferencesTitle = "Network";
String networkSharedPreferencesContent = "The internet connection is required for the first time launch, please leave on for few seconds :)";
String networkSharedPreferencesButton = "Okies";


String appOverviewSharedPreferencesKey = "overview_time";
String appOverviewSharedPreferencesTitle = "APP OVERVIEW";
String appOverviewSharedPreferencesContentOne = "This Yearbook App was developed for $departmentName, of $universityName, $stateName. $countryName.\n";
String appOverviewSharedPreferencesContentTwo = "Our vision is to raise the total Nigerian financially through comprehensive education.\n";
String appOverviewSharedPreferencesContentThree = "Welcome to our inventory, do read through and know more!";
String appOverviewSharedPreferencesButton = "Awesome";


Color backgroundColor = Color.fromRGBO(189, 170, 176, 1);
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(189, 150, 176, 1);
Color appBarIconColor = Colors.white;
Color modalColor = Color.fromRGBO(189, 150, 176, 1);
Color modalBackgroundColor = Colors.transparent;
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = Colors.white;
Color splashColor = Color.fromRGBO(189, 150, 176, 1);
Color iconColor = Colors.white;
Color textColor = Colors.white;
Color textColorTwo = Colors.white70;
Color dialogBackgroundColor = Color.fromRGBO(189, 170, 176, 1);
Color borderColor = Colors.black;


class MyDepartmentalGraduatesPageA extends StatefulWidget with NavigationStates {
  @override
  _MyDepartmentalGraduatesPageAState createState() => _MyDepartmentalGraduatesPageAState();
}

class _MyDepartmentalGraduatesPageAState extends State<MyDepartmentalGraduatesPageA> {
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Widget _buildProductItem(BuildContext context, int index) {
    DepartmentalGraduatesANotifier departmentalGraduatesANotifier = Provider.of<DepartmentalGraduatesANotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: borderColor.withAlpha(50),
        ),

        child: Material(
          color: materialBackgroundColor,
          child: InkWell(
            splashColor: splashColor,
            onTap: () {
              departmentalGraduatesANotifier.currentDepartmentalGraduatesA = departmentalGraduatesANotifier.departmentalGraduatesAList[index];
              navigateToDepartmentalGraduatesDetailsPageA(context);
            },

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                            alignment: Alignment(0, -1),
                            image: CachedNetworkImageProvider(
                                departmentalGraduatesANotifier.departmentalGraduatesAList[index].image
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            children: <Widget>[
                              Text(
                                  departmentalGraduatesANotifier.departmentalGraduatesAList[index].name,
                                  style: GoogleFonts.tenorSans(
                                      color: textColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600
                                  )
                              ),
                              (() {
                                if (departmentalGraduatesANotifier.departmentalGraduatesAList[index].departmentExecutive == "Yes") {
                                  return
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Icon (
                                          MdiIcons.checkboxMarkedCircle,
                                          color: iconColor,
                                        ),
                                      ],
                                    );
                                } else {
                                  return Visibility(
                                    visible: !_isVisible,
                                    child: Icon (
                                      MdiIcons.checkboxMarkedCircle,
                                      color: iconColor,
                                    ),
                                  );
                                }
                              }()),
                            ],
                          ),
                        ),
                        (() {
                          if (departmentalGraduatesANotifier.departmentalGraduatesAList[index].twitter.toString().isNotEmpty) {
                            if (!departmentalGraduatesANotifier.departmentalGraduatesAList[index].twitter.toString().contains("@")) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    departmentalGraduatesANotifier.departmentalGraduatesAList[index].twitter == departmentalGraduatesANotifier.departmentalGraduatesAList[index].twitter ? '@'+departmentalGraduatesANotifier.departmentalGraduatesAList[index].twitter : departmentalGraduatesANotifier.departmentalGraduatesAList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              );
                            }
                            else {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    departmentalGraduatesANotifier.departmentalGraduatesAList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              );
                            }
                          } else {
                            return Visibility(
                              visible: !_isVisible,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    departmentalGraduatesANotifier.departmentalGraduatesAList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              ),
                            );
                          }
                        }()),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),

        ),
        backgroundColor: dialogBackgroundColor,
        title: Text(exitAppTitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        content: Text(exitAppSubtitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text(exitAppYes,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future navigateToDepartmentalGraduatesDetailsPageA(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyDepartmentalGraduatesDetailsPageA()));
  }
  Future navigateToAboutAppDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAppDetails()));
  }
  Future navigateToAcronymsMeaningsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AcronymsMeanings()));
  }
  Future navigateToAboutDepartment(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutDepartment()));
  }
  Future navigateToAboutUniversityState(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUniversityState()));
  }
  Future navigateToWhoWeArePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WhoWeAre()));
  }

  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time');

    if (firstTime != null && !firstTime) {
      // Not first time
    } else {
      // First time
      prefs.setBool(networkSharedPreferencesKey, false);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),

          ),
          backgroundColor: dialogBackgroundColor,
          title: Text(networkSharedPreferencesTitle,
            style: TextStyle(
                color: textColor
            ),
          ),
          content: Text(networkSharedPreferencesContent,
            style: TextStyle(
                color: textColor
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(networkSharedPreferencesButton,
                style: TextStyle(
                    color: textColor
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  aboutAppWelcomeDialog() async {
    SharedPreferences appOverviewPrefs = await SharedPreferences.getInstance();
    bool appOverviewChecked = appOverviewPrefs.getBool('overview_time');

    if (appOverviewChecked != null && !appOverviewChecked) {
      // Not first time
    }
    else {
      // First time
      appOverviewPrefs.setBool(appOverviewSharedPreferencesKey, false);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),

          ),
          backgroundColor: dialogBackgroundColor,
          title: Text(
            appOverviewSharedPreferencesTitle,
            style: TextStyle(
                color: textColor
            ),
          ),
          content: Container(
            height: 220,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Text(
                    appOverviewSharedPreferencesContentOne,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: textColor
                    ),
                  ),
                  Text(
                    appOverviewSharedPreferencesContentTwo,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: textColor
                    ),
                  ),
                  Text(
                    appOverviewSharedPreferencesContentThree,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: textColor
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(appOverviewSharedPreferencesButton,
                style: TextStyle(
                    color: textColor
                ),
              ),
            )
          ],
        ),
      );
//    }
    }
  }


  @override
  void initState() {
    DepartmentalGraduatesANotifier departmentalGraduatesANotifier = Provider.of<DepartmentalGraduatesANotifier>(context, listen: false);
    getDepartmentalGraduatesA(departmentalGraduatesANotifier);

    startTime();

    aboutAppWelcomeDialog();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    DepartmentalGraduatesANotifier departmentalGraduatesANotifier = Provider.of<DepartmentalGraduatesANotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: backgroundColor,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(MdiIcons.formatFloatLeft,
                          color: appBarIconColor),
                      onPressed: () async {
                        showModalBottomSheet(
                            backgroundColor: modalBackgroundColor,
                            context: context,
                            builder: (context) => Container(
                              height: 300,
                              decoration: BoxDecoration(
                                color: modalColor,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                              ),
                              child: Material(
                                color: materialBackgroundColor,
                                child: InkWell(
                                  splashColor: splashColor,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Wrap(
                                      children: <Widget>[
                                        ListTile(
                                            leading: new Icon(MdiIcons.atom, color: iconColor),
                                            title: new Text(whoWeAre,
                                              style: GoogleFonts.zillaSlab(
                                                  color: textColor
                                              ),),
                                            onTap: () {
                                              navigateToWhoWeArePage(context);
                                            }
                                        ),
                                        ListTile(
                                          leading: new Icon(MdiIcons.chessQueen, color: iconColor),
                                          title: new Text(aboutDepartment,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),),
                                          onTap: () {
                                            navigateToAboutDepartment(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: new Icon(MdiIcons.chessKing, color: iconColor),
                                          title: new Text(aboutUniversity,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),),
                                          onTap: () {
                                            navigateToAboutUniversityState(context);
                                          },
                                        ),
                                        ListTile(
                                            leading: new Icon(MdiIcons.sortAlphabeticalAscending, color: iconColor),
                                            title: new Text(acronymMeanings,
                                              style: GoogleFonts.zillaSlab(
                                                  color: textColor
                                              ),),
                                            onTap: () {
                                              navigateToAcronymsMeaningsPage(context);
                                            }
                                        ),
                                        ListTile(
                                          leading: new Icon(MdiIcons.opacity, color: iconColor),
                                          title: new Text(aboutApp,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),),
                                          onTap: () {
                                            navigateToAboutAppDetailsPage(context);
                                          },
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                    IconButton(
                      icon: Icon(MdiIcons.magnify, color: iconColor),
                      onPressed: departmentalGraduatesANotifier.departmentalGraduatesAList == null
                          ? null
                          : (){
                        showSearch(
                          context: context,
                          delegate: MyDepartmentalGraduatesSearchA(all: departmentalGraduatesANotifier.departmentalGraduatesAList),
                        );
                      },
                      tooltip: "Search",
                    ),
                  ],
                  backgroundColor: appBarBackgroundColor,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Center(
                      heightFactor: 0.6,
                      child: Text(
                          thrownName,
                          style: GoogleFonts.amaticSC(
                              color: appBarTextColor,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                    background: Image.asset(imgAsset,
                      alignment: Alignment(0, -0.6),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Container(
                margin: new EdgeInsets.only( bottom: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                  itemBuilder: _buildProductItem,
                  itemCount: departmentalGraduatesANotifier.departmentalGraduatesAList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
