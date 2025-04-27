import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Models.dart';

class DataBase {
  DataBase._private();
  static final DataBase instance = DataBase._private();


  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory doc = await getApplicationDocumentsDirectory();
    String path = join(doc.path,"PeopleData.db");
    return await openDatabase(path,version: 1,onCreate: _onCreate);
  }
  Future _onCreate(Database db,int version) async{
    await db.execute(
        """
      CREATE TABLE PeopleD(
      email TEXT PRIMARY KEY,
      name TEXT,
      password TEXT,
      weight REAL,
      height REAL,
      birthYear REAL,
      image TEXT
      )
      """
    );
    await db.execute(
        """
        CREATE TABLE legsSensors(
        email TEXT PRIMARY KEY,
          LTO TEXT,
          LTH TEXT,
          LLO TEXT,
          LLH TEXT,
          LFO TEXT,
          LFH TEXT,
          RTO TEXT,
          RTH TEXT,
          RLO TEXT,
          RLH TEXT,
          RFO TEXT,
          RFH TEXT
          )
        """
    );
  }

  Future<List<Person>> getPersons() async{
    Database db = await instance.database;
    var persons = await db.query("peopleD",orderBy: "name");
    List<Person> personsList = persons.isEmpty ?
    [] : persons.map((e) => Person.fromJson(e)).toList();
    return personsList;
  }

  Future<int> addPerson(Person person) async{
    Database db = await instance.database;
    return await db.insert("peopleD", person.toJson());
  }

  Future<Person> getPersonByEmail(String email) async {
    Database db = await instance.database;
    var query = await db.rawQuery("SELECT * FROM PeopleD WHERE email=?",[email]);
    var person = query.map((e) => Person.fromJson(e)).toList().first;
    return person;
  }

  Future<bool> checkExistence(String email) async{
    Database db = await instance.database;
    var s = await db.rawQuery("SELECT * FROM peopleD WHERE email=?",[email]);
    return s.isNotEmpty;
  }

  Future<void> updatePerson(Person person) async{
    Database db = await instance.database;
    db.update("peopleD", person.toJson(),where: "email = ?", whereArgs: [person.email]);
  }

  Future<Person?> login(String email,String password) async {
    Database db= await instance.database;
    var res = await db.rawQuery("SELECT * FROM PeopleD WHERE email = '$email' and password = '$password'");
    if(res.isNotEmpty) return Person.fromJson(res.first);
    return null;
  }







}