import 'package:edutainment/screens/global_rank/page.dart';
import 'package:edutainment/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edutainment/utils/theme_constants.dart';
import 'package:edutainment/utils/constants.dart';
import 'package:edutainment/screens/home/page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:edutainment/screens/settings/page.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:edutainment/utils/theme_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edutainment/services/user_db.dart';


class PageStatistics extends StatefulWidget {
  static const String _pageName = kPageStatistics;

  @required
  int currentScore;
  int calculsScore;
  int geometryScore;
  int animalScore;
  PageStatistics(
      {this.currentScore,
      this.calculsScore,
      this.geometryScore,
      this.animalScore});

  static String getPageName() {
    return _pageName;
  }

  @override
  _PageStatisticsState createState() => _PageStatisticsState(userScore: currentScore);
}

class _PageStatisticsState extends State<PageStatistics> {
  var today = new DateTime.now();

  List<charts.Series<GraphPoint, DateTime>> _seriesData;

  List<charts.Series<PieCharts, String>> _seriesPieData;

  _generateData() {
    var DataCalculs = [
      //TODO: HNA CHANGIW  LA VALEUR ( EX : FI  LIGNE 1 CHANGIW 381.4  )ET LE NOMBRE DE LIGNES ( HNA 5) HOWA LE NOMBRE TA3 LES JOURS LI YKOUN FI AXE DES ABSCISSES
      new GraphPoint(today, 3.1, Color(0xff1490F5)), // 1
      new GraphPoint(new DateTime(today.year, today.month, today.day - 1), 8.4,
          Color(0xff1490F5)), // 2
      new GraphPoint(new DateTime(today.year, today.month, today.day - 2), 7.0,
          Color(0xff1490F5)), //3
      new GraphPoint(new DateTime(today.year, today.month, today.day - 3), 7,
          Color(0xff1490F5)), //4
      new GraphPoint(new DateTime(today.year, today.month, today.day - 4), 11.7,
          Color(0xff1490F5)), //5
    ];

    // TODO : DATA1 : TA3 LES CALCULS      , DATA2 : TA3 GEOMETRY             DATA3 : TA3 ANIMALS

    var DataGeometry = [
      new GraphPoint(today, 2.1, Color(0xFF2CBAA4)),
      new GraphPoint(new DateTime(today.year, today.month, today.day - 1), 2.4,
          Color(0xFF2CBAA4)),
      new GraphPoint(new DateTime(today.year, today.month, today.day - 2), 11.7,
          Color(0xFF2CBAA4)),
      new GraphPoint(new DateTime(today.year, today.month, today.day - 3), 8.7,
          Color(0xFF2CBAA4)),
      new GraphPoint(new DateTime(today.year, today.month, today.day - 4), 9.7,
          Color(0xFF2CBAA4)),
    ];

    var DataAnimals = [
      new GraphPoint(today, 1.1, Color(0xFFEDAE1D)),
      new GraphPoint(new DateTime(today.year, today.month, today.day - 1), 4.2,
          Color(0xFFEDAE1D)),
      new GraphPoint(new DateTime(today.year, today.month, today.day - 2), 12.7,
          Color(0xFFEDAE1D)),
      new GraphPoint(new DateTime(today.year, today.month, today.day - 3), 20.7,
          Color(0xFFEDAE1D)),
      new GraphPoint(new DateTime(today.year, today.month, today.day - 4), 9.3,
          Color(0xFFEDAE1D)),
    ];

    var pieData = [
      new PieCharts(
          'Calculs',
          25.toDouble(),
          Color(
              0xff1490F5)), //TODO: CHANGIW LA VALEUR 352.1 BRK EN PLUS HADA TA3 CIRCLE
      new PieCharts('Geometry', 38.toDouble(), Color(0xFF2CBAA4)),
      new PieCharts('Animals', 22.toDouble(), Color(0xFFEDAE1D)),
    ];

    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (PieCharts task, _) => task.task,
        measureFn: (PieCharts task, _) => task.valueTask,
        colorFn: (PieCharts task, _) =>
            charts.ColorUtil.fromDartColor(task.colorTask),
        id: 'Daily Evaluation1',
        labelAccessorFn: (PieCharts row, _) => '${row.valueTask}',
      ),
    );

    _seriesData.add(
      charts.Series(
        id: 'Daily Evaluation calculs',
        colorFn: (GraphPoint Score, _) =>
            charts.ColorUtil.fromDartColor(Score.color),
        domainFn: (GraphPoint score, _) => score.time,
        measureFn: (GraphPoint Score, _) => Score.score,
        data: DataCalculs,
      ),
    );

    _seriesData.add(
      charts.Series(
        id: 'Daily Evaluation geometry',
        colorFn: (GraphPoint Score, _) =>
            charts.ColorUtil.fromDartColor(Score.color),
        domainFn: (GraphPoint score, _) => score.time,
        measureFn: (GraphPoint Score, _) => Score.score,
        data: DataGeometry,
      ),
    );
    _seriesData.add(
      charts.Series(
        id: 'Daily Evaluation animals',
        colorFn: (GraphPoint Score, _) =>
            charts.ColorUtil.fromDartColor(Score.color),
        domainFn: (GraphPoint score, _) => score.time,
        measureFn: (GraphPoint Score, _) => Score.score,
        data: DataAnimals,
      ),
    );
  }

  int _selectedIndex = 2;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;
  String userName;
  int userScore;
  List<QueryDocumentSnapshot> userDocs;

  _PageStatisticsState({this.userScore});

  void _onItemTapped(int index) {
    setState(() async {
      userName = await UserDB(uid: user.uid).getUserName();
      userScore = await UserDB(uid: user.uid).getUserScore();
      userDocs = await UserDB(uid: user.uid).getUsers();
      userDocs.sort((a, b) => a.data()['score'].compareTo(b.data()['score']));
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PageHome()),
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PageGlobalRank(
                    userDocs: userDocs.reversed.toList(),
                    userName: userName,
                    userScore: userScore)),
          );
          break;
        case 2:
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PageSettings(
                      email: user.email,
                      nom: userName,
                      user: user,
                    )),
          );
          break;
        default:
          break;
      }
    });
  }

  void initState() {
    super.initState();
    _seriesData = List<charts.Series<GraphPoint, DateTime>>();
    _seriesPieData = List<charts.Series<PieCharts, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kVioletColor,
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  userScore.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 50.0,
                  ),
                ),
                Text(
                  'points',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: charts.PieChart(
                      _seriesPieData,
                      animate: true,
                      animationDuration: Duration(seconds: 2),
                      behaviors: [
                        new charts.DatumLegend(
                          outsideJustification:
                              charts.OutsideJustification.middleDrawArea,
                          horizontalFirst: false,
                          desiredMaxRows: 1,
                          cellPadding: new EdgeInsets.only(
                              left: 40.0, bottom: 4.0, top: 10),
                          entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.blue.shadeDefault,
                            fontFamily: 'OpenSans',
                            fontSize: 11,
                          ),
                        )
                      ],
                      defaultRenderer: new charts.ArcRendererConfig(
                          arcWidth: 100,
                          arcRendererDecorators: [
                            new charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside,
                            )
                          ]),
                    ),
                  ),
                  Expanded(
                      child: charts.TimeSeriesChart(
                    _seriesData,
                    animate: true,
                    animationDuration: Duration(seconds: 1),
                    // Configure the default renderer as a line renderer. This will be used
                    // for any series that does not define a rendererIdKey.
                    //
                    // This is the default configuration, but is shown here for  illustration.
                    defaultRenderer: new charts.LineRendererConfig(),
                    // Custom renderer configuration for the point series.
                    customSeriesRenderers: [
                      new charts.PointRendererConfig(
                          customRendererId: 'customPoint')
                    ],
                    // Optionally pass in a [DateTimeFactory] used by the chart. The factory
                    // should create the same type of [DateTime] as the data provided. If none
                    // specified, the default creates local date time.
                    dateTimeFactory: const charts.LocalDateTimeFactory(),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey[500],
            ),
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
              color: Color(0xFF3347FF),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icon rank.svg'),
            label: 'Rang',
            activeIcon: SvgPicture.asset('assets/icon rank active.svg'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icon stats.svg'),
            label: 'Statistiques',
            activeIcon: SvgPicture.asset('assets/icon stats active.svg'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.grey[500],
            ),
            label: 'Paramètres',
            activeIcon: Icon(
              Icons.settings,
              color: Color(0xFF3347FF),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF3347FF),
        onTap: _onItemTapped,
      ),
    );
  }
}

class PieCharts {
  String task;
  double valueTask;
  Color colorTask;

  PieCharts(this.task, this.valueTask, this.colorTask);
}

class GraphPoint {
  final DateTime time;
  final double score;
  final Color color;
  GraphPoint(this.time, this.score, this.color);
}
