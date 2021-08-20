import 'dart:async';

import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/dao.dart';
import 'entity/entity.dart';

/// For generation app_database.g.dart should run this command:
/// flutter packages pub run build_runner build
part 'app_database.g.dart';

@Database(version: 1, entities: [TaskEntity])
abstract class AppDatabase extends FloorDatabase {
  TaskDao get taskDao;
}