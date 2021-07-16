import 'package:edutainment/models/classes/Statistics.dart';
import 'package:edutainment/screens/statistics/page.dart';
import 'package:edutainment/utils/theme_constants.dart';

final String tableStatistics = "tableStatistics";

class StatisticsFields {
  static final List<String> values = [
    id,
    year,
    month,
    day,
    calculs,
    geometry,
    animals
  ];
  static final String id = "_id";
  static final String year = "year";
  static final String month = "month";
  static final String day = "day";
  static final String calculs = "calculs";
  static final String geometry = "geometry";
  static final String animals = "animals";
}

class StatisticsDBModel {
  int id;
  int year;
  int month;
  int day;
  int calculs;
  int geometry;
  int animals;
  StatisticsDBModel(
      {int id,
      int year,
      int month,
      int day,
      int calculs,
      int geometry,
      int animals});

  Map<String, dynamic> toMap() {
    return {
      StatisticsFields.id: this.id,
      StatisticsFields.year: this.year,
      StatisticsFields.month: this.month,
      StatisticsFields.day: this.day,
      StatisticsFields.calculs: this.calculs,
      StatisticsFields.geometry: this.geometry,
      StatisticsFields.animals: this.animals
    };
  }

  static StatisticsDBModel fromMap(Map<String, dynamic> map) =>
      StatisticsDBModel(
        id: map[StatisticsFields.id],
        year: map[StatisticsFields.year],
        month: map[StatisticsFields.month],
        day: map[StatisticsFields.day],
        calculs: map[StatisticsFields.calculs],
        geometry: map[StatisticsFields.geometry],
        animals: map[StatisticsFields.animals],
      );
  StatisticsDBModel copy({
    int id,
    int year,
    int month,
    int day,
    int calculs,
    int geometry,
    int animals,
  }) =>
      StatisticsDBModel(
        id: id == null ? this.id : id,
        year: year == null ? this.year : year,
        month: month == null ? this.month : month,
        day: day == null ? this.day : day,
        calculs: calculs == null ? this.calculs : calculs,
        geometry: geometry == null ? this.geometry : geometry,
        animals: animals == null ? this.animals : animals,
      );

  List<GraphPoint> convertToRealGraphPoint() {
    List<GraphPoint> list = [
      GraphPoint(
        DateTime(this.year, this.month, this.day),
        this.calculs.toDouble(),
        kBlueColor,
      ),
      GraphPoint(
        DateTime(this.year, this.month, this.day),
        this.geometry.toDouble(),
        kGreenColor,
      ),
      GraphPoint(
        DateTime(this.year, this.month, this.day),
        this.animals.toDouble(),
        kYellowColor,
      ),
    ];
    return list;
  }
}
