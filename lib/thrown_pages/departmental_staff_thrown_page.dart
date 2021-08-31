import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../about_menu_details_pages/about_app.dart';
import '../about_menu_details_pages/about_department.dart';
import '../about_menu_details_pages/about_university.dart';
import '../about_menu_details_pages/acronyms_meanings.dart';
import '../about_menu_details_pages/who_we_are.dart';
import '../api/departmental_staff_api.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../details_pages/departmental_staff_details_page.dart';
import '../notifier/departmental_staff_notifier.dart';
import '../thrown_searches/departmental_staff_thrown_search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

String universityName = "University of Benin";
String departmentName = "Economics Department";
String thrownName = "Departmental Staff";

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

String imgAsset = "assets/images/uni_studs_6.jpg";



Color backgroundColor = Color.fromRGBO(167, 129, 29, 1);
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(167, 119, 29, 1);
Color appBarIconColor = Colors.white;
Color modalColor = Color.fromRGBO(167, 119, 29, 1);
Color modalBackgroundColor = Colors.transparent;
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = Colors.white;
Color splashColor = Color.fromRGBO(167, 119, 29, 1);
Color iconColor = Colors.white;
Color textColor = Colors.white;
Color dialogBackgroundColor = Color.fromRGBO(167, 129, 29, 1);
Color borderColor = Colors.black;


class MyDepartmentalStaffPage extends StatefulWidget with NavigationStates {

  MyDepartmentalStaffPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyDepartmentalStaffPageState createState() => _MyDepartmentalStaffPageState();
}

class _MyDepartmentalStaffPageState extends State<MyDepartmentalStaffPage> {

  Widget _buildProductItem(BuildContext context, int index) {
    DepartmentalStaffNotifier departmentalStaffNotifier = Provider.of<DepartmentalStaffNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color: borderColor.withAlpha(50),
        ),

        child: Material(
          color: materialBackgroundColor,
          child: InkWell(
            splashColor: splashColor,
            onTap: () {
              departmentalStaffNotifier.currentDepartmentalStaff = departmentalStaffNotifier.departmentalStaffList[index];
              navigateToDepartmentalStaffDetailsPage(context);
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
                                departmentalStaffNotifier.departmentalStaffList[index].image
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
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              Text(
                                  departmentalStaffNotifier.departmentalStaffList[index].name,
                                  style: GoogleFonts.tenorSans(
                                      color: textColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600
                                  )
                              ),

                              SizedBox(width: 10),
                              Icon (
                                  MdiIcons.checkboxMarkedCircle,
                                  color: iconColor
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                              departmentalStaffNotifier.departmentalStaffList[index].staffPosition,
                              style: GoogleFonts.varela(
                                  color: textColor,
                                  fontStyle: FontStyle.italic
                              )
                          ),
                        ),
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
              color: iconColor
          ),
        ),
        content: Text(exitAppSubtitle,
          style: TextStyle(
              color: iconColor
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo,
              style: TextStyle(
                  color: iconColor
              ),
            ),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text(exitAppYes,
              style: TextStyle(
                  color: iconColor
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future navigateToDepartmentalStaffDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyDepartmentalStaffDetailsPage()));
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

  @override
  void initState() {
    DepartmentalStaffNotifier departmentalStaffNotifier = Provider.of<DepartmentalStaffNotifier>(context, listen: false);
    getDepartmentalStaff(departmentalStaffNotifier);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    DepartmentalStaffNotifier departmentalStaffNotifier = Provider.of<DepartmentalStaffNotifier>(context);

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
                      icon: Icon(MdiIcons.formatFloatLeft, color: iconColor),
                      onPressed: () {
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
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          leading: new Icon(MdiIcons.atom,
                                              color: iconColor
                                          ),
                                          title: new Text(whoWeAre,
                                            style: GoogleFonts.zillaSlab(
                                                color: iconColor
                                            ),
                                          ),
                                          onTap: () {
                                            navigateToWhoWeArePage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessQueen,
                                            color: iconColor
                                        ),
                                        title: new Text(aboutDepartment,
                                          style: GoogleFonts.zillaSlab(
                                              color: iconColor
                                          ),
                                        ),
                                        onTap: () {
                                          navigateToAboutDepartment(context);
                                        },
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessKing,
                                            color: iconColor
                                        ),
                                        title: new Text(aboutUniversity,
                                          style: GoogleFonts.zillaSlab(
                                              color: textColor
                                          ),
                                        ),
                                        onTap: () {
                                          navigateToAboutUniversityState(context);
                                        },
                                      ),
                                      ListTile(
                                          leading: new Icon(MdiIcons.sortAlphabeticalAscending,
                                              color: iconColor
                                          ),
                                          title: new Text(acronymMeanings,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),
                                          ),
                                          onTap: () {
                                            navigateToAcronymsMeaningsPage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.opacity,
                                            color: iconColor
                                        ),
                                        title: new Text(aboutApp,
                                          style: GoogleFonts.zillaSlab(
                                              color: textColor
                                          ),
                                        ),
                                        onTap: () {
                                          navigateToAboutAppDetailsPage(context);
                                        },
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                    IconButton(
                      icon: Icon(MdiIcons.magnify, color: iconColor),
                      onPressed: departmentalStaffNotifier.departmentalStaffList == null
                          ? null
                          : (){
                        showSearch(
                          context: context,
                          delegate: MyDepartmentalStaffSearch(all: departmentalStaffNotifier.departmentalStaffList),
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
                          style:  GoogleFonts.amaticSC(
                              color: textColor,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                    background: Image.asset(imgAsset,
                      alignment: Alignment(0, -1),
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
                  itemCount: departmentalStaffNotifier.departmentalStaffList.length,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
