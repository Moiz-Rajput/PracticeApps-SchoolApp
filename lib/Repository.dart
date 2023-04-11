import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class Repository {
  var database;

  Repository({this.database});

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initdb();
    return _db;
  }

  initdb() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'school_management.db'),
      onUpgrade: _onUpgrade,
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE users(user_id INTEGER,display_name TEXT,email_address TEXT,password TEXT,department TEXT,time_stamp TEXT,created_on TEXT)");
        db.execute(
            "CREATE TABLE class(id INTEGER,label TEXT,fee INTEGER)");
        db.execute(
            "CREATE TABLE student(id INTEGER,name TEXT,class Text)");
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    return database;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {

    /*  if (oldVersion < newVersion) {
      db.execute("ALTER TABLE registered_outlets ADD COLUMN area_label text;");
      db.execute(
          "ALTER TABLE registered_outlets ADD COLUMN sub_area_label text;");
      print("haseeb called1");
    }
    print("haseeb called");*/
  }

  Future insertClasses(String label,int fee) async {
    await this.initdb();
    final Database db = await database;

    int k = 0;
    try {

List  args =new List();
        args.add(label);
        args.add(fee);
        k = await db.rawInsert(
            'insert into class (label,fee) values  (?,?) ', args);

    } catch (error) {
      print("//print ERROR");
      //print(error);
    }
    if (k > 0) {
      //print("created");
      return true;
    } else {
      //print("not created");
      return false;
    }
  }



  Future<List<Map<String, dynamic>>> getClassesData() async {
    // Get a reference to the database.
    await this.initdb();
    final Database db = await database;
    final List<Map> maps = await db.rawQuery(
        'SELECT * FROM class ');
print("maps"+maps.toString());    return maps;
  }

}
