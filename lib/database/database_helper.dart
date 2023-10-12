import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "vocab.db";
  static const _databaseVersion = 1;
  static const table = 'levels';
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';
  // สร้าง instant 
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  //สร้าง การเชื่อมต่อ db 
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  //ทำการเปิด db แล้ว ตรวจว่ามีหรือยัง ถ้าไม่มีให้สร้าง db
  _initDatabase() async {

    var dbDir = await getDatabasesPath();
    String path = join(dbDir, _databaseName);
    log(path);
    bool exists = await File(path).exists();

    if (!exists) {
      ByteData data = await rootBundle.load("assets/databases/vocab.db");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    }

    return await openDatabase(path);

    // return await openDatabase(path,
    //     version: _databaseVersion, onCreate: _onCreate);
  }
}
