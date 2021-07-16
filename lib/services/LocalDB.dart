import 'package:flutter/cupertino.dart';

import 'QuestionCalculesDBModel.dart';
import 'QuestionAnimalsDBModel.dart';
import 'QuestionGeometryDBModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'defaultData.dart';
import 'StatisticsDBModel.dart';

class LocalDB {
  static final LocalDB instance = LocalDB._init();
  static Database _database;

  LocalDB._init();
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB('questions.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final integerType = 'INTEGER NOT NULL';
    final boolType = 'INTEGER NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
  CREATE TABLE $tableQuestionsCalcules (
  ${QuestionCalculesBDFields.id} $idType,
  ${QuestionCalculesBDFields.level} $integerType,
  ${QuestionCalculesBDFields.numberA} $textType,
  ${QuestionCalculesBDFields.numberB} $textType,
  ${QuestionCalculesBDFields.answer} $integerType)
  
  ''');

    await db.execute('''
   CREATE TABLE $tableQuestionsGeometry (
  ${QuestionGeometryBDFields.id} $idType,
  ${QuestionGeometryBDFields.level} $integerType,
  ${QuestionGeometryBDFields.type} $integerType,
  ${QuestionGeometryBDFields.usesInput} $boolType,
  ${QuestionGeometryBDFields.questionText} $textType,
  ${QuestionGeometryBDFields.answers} $textType,
  ${QuestionGeometryBDFields.correctIndex} $integerType,
  ${QuestionGeometryBDFields.imagePath} $textType
  )
  
  ''');
    await db.execute('''
  CREATE TABLE $tableQuestionsAnimals (
  ${QuestionAnimalsBDFields.id} $idType,
  ${QuestionAnimalsBDFields.level} $integerType,
  ${QuestionAnimalsBDFields.type} $integerType,
  ${QuestionAnimalsBDFields.usesInput} $boolType,
  ${QuestionAnimalsBDFields.questionText} $textType,
  ${QuestionAnimalsBDFields.answers} $textType,
  ${QuestionAnimalsBDFields.correctIndex} $integerType,
  ${QuestionAnimalsBDFields.imagePath} $textType,
  ${QuestionAnimalsBDFields.audioPath} $textType
  )
  
  ''');

    await db.execute('''
     CREATE TABLE $tableStatistics (
  ${StatisticsFields.id} $idType,
  ${StatisticsFields.year} $integerType,
  ${StatisticsFields.month} $integerType,
  ${StatisticsFields.day} $integerType,
  ${StatisticsFields.calculs} $integerType,
  ${StatisticsFields.geometry} $integerType,
  ${StatisticsFields.animals} $integerType
  )
  ''');
  }

  Future<QuestionCalculesDBModel> insertCalculs(
      {QuestionCalculesDBModel questionCalcules}) async {
    final db = await instance.database;
    final id =
        await db.insert(tableQuestionsCalcules, questionCalcules.toMap());
    return questionCalcules.copy(id: id);
  }

  Future<QuestionGeometryDBModel> insertGeometry(
      {QuestionGeometryDBModel questionGeometry}) async {
    final db = await instance.database;
    final id =
        await db.insert(tableQuestionsGeometry, questionGeometry.toMap());
    return questionGeometry.copy(id: id);
  }

  Future<QuestionAnimalsDBModel> insertAnimals(
      {QuestionAnimalsDBModel questionAnimals}) async {
    final db = await instance.database;
    final id = await db.insert(tableQuestionsAnimals, questionAnimals.toMap());
    return questionAnimals.copy(id: id);
  }

  Future<StatisticsDBModel> insertStatistics(
      {StatisticsDBModel statistics}) async {
    final db = await instance.database;
    final id = await db.insert(tableStatistics, statistics.toMap());
    return statistics.copy(id: id);
  }

  Future<QuestionCalculesDBModel> readCalculs(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableQuestionsCalcules,
      columns: QuestionCalculesBDFields.values,
      where: '${QuestionCalculesBDFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return QuestionCalculesDBModel.fromMap(maps.first);
    } else {
      throw Exception('Id $id is not found');
    }
  }

  Future<QuestionGeometryDBModel> readGeometry(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableQuestionsGeometry,
      columns: QuestionGeometryBDFields.values,
      where: '${QuestionGeometryBDFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return QuestionGeometryDBModel.fromMap(maps.first);
    } else {
      throw Exception('Id $id is not found');
    }
  }

  Future<QuestionAnimalsDBModel> readAnimals(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableQuestionsAnimals,
      columns: QuestionAnimalsBDFields.values,
      where: '${QuestionAnimalsBDFields.id} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return QuestionAnimalsDBModel.fromMap(maps.first);
    } else {
      throw Exception('Id $id is not found');
    }
  }

  Future<StatisticsDBModel> readStatistics({@required DateTime time}) async {
    final db = await instance.database;
    final maps = await db.query(
      tableStatistics,
      columns: StatisticsFields.values,
      where: '${StatisticsFields.year} = ? ',
      whereArgs: [time.year, time.month, time.day],
    );
    if (maps.isNotEmpty) {
      return StatisticsDBModel.fromMap(maps.first);
    } else {
      throw Exception('Date is not found');
    }
  }

  Future<List<QuestionCalculesDBModel>> readLevelCalculs(int level) async {
    final db = await instance.database;
    final result = await db.query(tableQuestionsCalcules,
        where: '${QuestionCalculesBDFields.level} = ?', whereArgs: [level]);
    List<QuestionCalculesDBModel> questions;
    if (result.isNotEmpty) {
      questions =
          result.map((map) => QuestionCalculesDBModel.fromMap(map)).toList();
      return questions;
    } else {
      for (QuestionCalculesDBModel questionCalcules in defaultCalcules) {
        if (questionCalcules.level == level)
          insertCalculs(questionCalcules: questionCalcules);
      }
      questions = defaultCalcules;
    }
    return questions;
  }

  Future<List<QuestionGeometryDBModel>> readLevelGeometry(int level) async {
    final db = await instance.database;
    final result = await db.query(tableQuestionsGeometry,
        where: '${QuestionGeometryBDFields.level} = ?', whereArgs: [level]);
    List<QuestionGeometryDBModel> questions;
    if (result.isNotEmpty) {
      questions =
          result.map((map) => QuestionGeometryDBModel.fromMap(map)).toList();
      return questions;
    } else {
      for (QuestionGeometryDBModel questionGeometry in defaultGeometry) {
        if (questionGeometry.level == level)
          insertGeometry(questionGeometry: questionGeometry);
      }
      questions = defaultGeometry;
    }
    return questions;
  }

  Future<List<QuestionAnimalsDBModel>> readLevelAnimals(int level) async {
    final db = await instance.database;
    final result = await db.query(tableQuestionsAnimals,
        where: '${QuestionAnimalsBDFields.level} = ?', whereArgs: [level]);
    List<QuestionAnimalsDBModel> questions;
    if (result.isNotEmpty) {
      questions =
          result.map((map) => QuestionAnimalsDBModel.fromMap(map)).toList();
      return questions;
    } else {
      for (QuestionAnimalsDBModel questionAnimals in defaultAnimals) {
        if (questionAnimals.level == level)
          insertAnimals(questionAnimals: questionAnimals);
      }
      questions = defaultAnimals;
    }
    return questions;
  }

  Future<List<StatisticsDBModel>> readAllStatistics() async {
    List<StatisticsDBModel> defaultStatistics = [
      StatisticsDBModel(
        id: 0,
        year: 2020,
        month: 7,
        day: 5,
        calculs: 0,
        geometry: 0,
        animals: 0,
      ),
      StatisticsDBModel(
        id: 1,
        year: 2020,
        month: 7,
        day: 6,
        calculs: 1,
        geometry: 2,
        animals: 3,
      ),
      StatisticsDBModel(
        id: 2,
        year: 2020,
        month: 7,
        day: 7,
        calculs: 5,
        geometry: 6,
        animals: 7,
      ),
    ];
    final db = await instance.database;
    final result =
        await db.query(tableStatistics, where: '${StatisticsFields.day} > 0');
    List<StatisticsDBModel> statistics;
    if (result.isNotEmpty) {
      statistics = result.map((map) => StatisticsDBModel.fromMap(map)).toList();
      return statistics;
    } else {
      for (int i = 0; i < defaultStatistics.length; i++) {
        insertStatistics(statistics: defaultStatistics.elementAt(i));
      }
      statistics = defaultStatistics;
    }
    return statistics;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
