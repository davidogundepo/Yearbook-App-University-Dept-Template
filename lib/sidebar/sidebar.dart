import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../notifier/sidebar_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../sidebar/menu_item.dart';

String departmentName = "Economics Department";
String title = "Economics Department".toUpperCase();
String subtitle = "University of Benin";

String departmentTitleA = "Economics Graduates Class A";
String departmentTitleB = "Economics Graduates Class B";
String departmentTitleC = "Economics Graduates Class C";
String departmentTitleD = "Economics Graduates Class D";
String executiveMembers = "Executive Class Members";
String staffMembers = "Departmental Staff Officials";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";

String imgAsset = "assets/images/uni_studs_1.jpg";


Color gradientColor = Color.fromRGBO(162, 78, 124, 1);
Color gradientColorTwo = Color.fromRGBO(162, 92, 124, 1);
Color linearGradientColor = Color.fromRGBO(162, 92, 124, 1);
Color linearGradientColorTwo = Color.fromRGBO(162, 92, 124, 1);
Color boxShadowColor = Color.fromRGBO(162, 92, 124, 1);
Color dividerColor = Colors.white;
Color materialBackgroundColor = Colors.transparent;
Color shimmerBaseColor = Colors.white;
Color shimmerHighlightColor = Color.fromRGBO(162, 30, 124, 1);
Color shapeDecorationTextColor = Colors.white;
Color shapeDecorationTextColorTwo = Color.fromRGBO(162, 30, 124, 1);
Color containerBackgroundColor = Color.fromRGBO(162, 30, 124, 1);
Color containerBackgroundColorTwo = Color.fromRGBO(162, 78, 124, 1);
Color containerIconColor = Colors.white70;
Color dialogBackgroundColor = Color.fromRGBO(162, 78, 124, 1);
Color dialogTextColor = Colors.white;
Color splashColor = Color.fromRGBO(162, 92, 124, 1);
Color splashColorTwo = Color.fromRGBO(162, 30, 124, 1);


class SideBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SideBarState();

}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {

  int _currentNAVSelected = 0;

  _onSelected(int index) {
    setState(() => _currentNAVSelected = index);
  }

  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final bool isSidebarOpened = false;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      Provider.of<SideBarNotifier>(context, listen: false).setIsOpened(false);
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      Provider.of<SideBarNotifier>(context, listen: false).setIsOpened(true);
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screeWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSidebarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSidebarOpenedAsync.data ? 0 : -screeWidth,
          right: isSidebarOpenedAsync.data ? 0 : screeWidth - 55,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  elevation: 20,
                  margin: EdgeInsets.all(0),
                  child: Align(
                    alignment: Alignment(0, -1.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [gradientColor, gradientColorTwo]
                          )
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 60,
                            ),
                            Stack(
                              children: <Widget>[
                                Opacity(
                                  opacity: 1.0,
                                  child: Container(
                                    child: Material(
                                      color: materialBackgroundColor,
                                      child: InkWell(
                                        splashColor: splashColor,
                                        onTap: () {},
                                        child: Align(
                                          alignment: Alignment(0, 0.9),
                                          child: ListTile(
                                            title: Shimmer.fromColors(
                                              baseColor: shimmerBaseColor,
                                              highlightColor: shimmerHighlightColor,
                                              period: Duration(seconds: 2),
                                              child: Text(
                                                title,
                                                style: GoogleFonts.pacifico(
                                                    color: shapeDecorationTextColor,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w800,
                                                  shadows: <Shadow>[
                                                    Shadow(
                                                      blurRadius: 30,
                                                      color: shapeDecorationTextColor,
                                                      offset: Offset.fromDirection(100, 12)
                                                    )
                                                  ]
                                                ),
                                              ),
                                            ),
                                            subtitle: Text(
                                              subtitle,
                                              style: GoogleFonts.varela(
                                                color: shapeDecorationTextColorTwo,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height * 0.4,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: new ExactAssetImage(imgAsset),
                                        fit: BoxFit.cover,
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [linearGradientColor, linearGradientColorTwo],
                                        stops: [0.3, 1],

                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: boxShadowColor,
                                          blurRadius: 12,
                                          offset: Offset(3, 12),
                                        )
                                      ],
                                      borderRadius: new BorderRadius.circular(10),
                                    ),


                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 30,
                              thickness: 0.5,
                              color: dividerColor.withOpacity(0.3),
                              indent: 32,
                              endIndent: 32,
                            ),
                            Material(
                              color: _currentNAVSelected == 0 ? containerBackgroundColor.withOpacity(0.3) : materialBackgroundColor,
                              child: InkWell(
                                splashColor: splashColorTwo,
                                onTap: () {
                                  _onSelected(0);
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyDepartmentalGraduatesAClickedEvent);
                                },
                                child:Align(
                                  alignment: Alignment.centerLeft,
                                  child: MenuItem(
                                        icon: MdiIcons.accountGroup,
                                        title: departmentTitleA,
                                      ),
                                ),
                              ),
                            ),
                            Material(
                              color: _currentNAVSelected == 1 ? containerBackgroundColor.withOpacity(0.3) : materialBackgroundColor,
                              child: InkWell(
                                splashColor: splashColorTwo,
                                onTap: () {
                                  _onSelected(1);
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyDepartmentalGraduatesBClickedEvent);
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: MenuItem(
                                    icon: MdiIcons.accountGroup,
                                    title: departmentTitleB,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: _currentNAVSelected == 2 ? containerBackgroundColor.withOpacity(0.3) : materialBackgroundColor,
                              child: InkWell(
                                splashColor: splashColorTwo,
                                onTap: () {
                                  _onSelected(2);
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyDepartmentalGraduatesCClickedEvent);
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: MenuItem(
                                    icon: MdiIcons.accountGroup,
                                    title: departmentTitleC,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: _currentNAVSelected == 3 ? containerBackgroundColor.withOpacity(0.3) : materialBackgroundColor,
                              child: InkWell(
                                splashColor: splashColorTwo,
                                onTap: () {
                                  _onSelected(3);
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyDepartmentalGraduatesDClickedEvent);
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: MenuItem(
                                    icon: MdiIcons.accountGroup,
                                    title: departmentTitleD,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: _currentNAVSelected == 4 ? containerBackgroundColor.withOpacity(0.3) : materialBackgroundColor,
                              child: InkWell(
                                splashColor: splashColorTwo,
                                onTap: () {
                                  _onSelected(4);
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyDepartmentalExecutivesClickedEvent);
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: MenuItem(
                                    icon: MdiIcons.accountGroup,
                                    title: executiveMembers,
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: _currentNAVSelected == 5 ? containerBackgroundColor.withOpacity(0.3) : materialBackgroundColor,
                              child: InkWell(
                                splashColor: splashColorTwo,
                                onTap: () {
                                  _onSelected(5);
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyDepartmentalStaffClickedEvent);
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: MenuItem(
                                    icon: MdiIcons.accountGroup,
                                    title: staffMembers,
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              height: 64,
                              thickness: 0.5,
                              color: dividerColor.withOpacity(0.3),
                              indent: 32,
                              endIndent: 32,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: Material(
                                color: materialBackgroundColor,
                                child: InkWell(
                                  splashColor: splashColorTwo,
                                  onTap: () {
                                    _onWillPop();
                                    onIconPressed();
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: MenuItem(
                                      icon: MdiIcons.logout,
                                      title: exitAppStatement,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.4, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Card(
                      elevation: 20,
                      margin: EdgeInsets.all(0),
                      child: Container(
                        width: 35,
                        height: 110,
                        color: containerBackgroundColorTwo,
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color: containerIconColor,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
              color: dialogTextColor
          ),
        ),
        content: Text(exitAppSubtitle,
          style: TextStyle(
              color: dialogTextColor
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo,
              style: TextStyle(
                  color: dialogTextColor
              ),
            ),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text(exitAppYes,
              style: TextStyle(
                  color: dialogTextColor
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

}

class CustomPILLCardShapePainter extends CustomPainter {

  final double radius;
  final Color startColor;
  final Color endColor;

  CustomPILLCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var david = Paint();
    david.shader = ui.Gradient.linear(
        Offset(0,0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),endColor
    ]);

    var jesus = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(jesus, david);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return true;
  }


}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = materialBackgroundColor;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return true;
  }

}