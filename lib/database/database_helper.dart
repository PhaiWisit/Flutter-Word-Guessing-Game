import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "vocab.db";
  // ignore: unused_field
  static const _databaseVersion = 1;
  static const table = 'levels';
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';
  // สร้าง instant สำหรับเรียกใช้ db ก่อน
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  //สร้าง การเชื่อมต่อ db ของตนเอง
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  //ทำการเปิด db แล้ว ตรวจว่ามีหรือยัง ถ้าไม่มีให้สร้าง db
  _initDatabase() async {
    // Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // String path = join(documentsDirectory.path, _databaseName);

    var dbDir = await getDatabasesPath();
    String path = join(dbDir, _databaseName);
    log(path);

    ByteData data = await rootBundle.load("assets/databases/vocab.db");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);

    return await openDatabase(path);

    // return await openDatabase(path,
    //     version: _databaseVersion, onCreate: _onCreate);
  }

  // Future<int> insert(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //   return await db.insert(table, row);
  // }

//ดึงข้อมูลแล้วนับจำนวน Row Count กลับไปว่ามีข้อมูลกี่ row
  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return 
    Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table')
        );
  }

  //ดึงข้อมูลแบบหลาย  Row
  Future<List<Map<String, dynamic>>> queryAllRow() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<String> queryAllRowAsJson() async {
  Database db = await instance.database;
  List<Map<String, dynamic>> rows = await db.query(table);
  return json.encode(rows);
}

  //บันทึกข้อมูลลงฐานข้อมูล
  // Future<int> update(Map<String, dynamic> row) async {
  //   Database db = await instance.database;
  //   int id = row[columnId];
  //   return await db.update(table, row, where: '$columnId= ?', whereArgs: [id]);
  // }

  //ลบข้อมูลจากฐานข้อมูล
  // Future<int> delete(int id) async {
  //   Database db = await instance.database;
  //   return await db.delete(table, where: '$columnId= ?', whereArgs: [id]);
  // }
}
