import 'package:fireman/model/record_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  late Future<Database> database;

  factory DatabaseService() => _databaseService;
  DatabaseService._internal() {
    databaseConfig();
  }

  Future<bool> databaseConfig() async {
    try {
      database = openDatabase(
        join(await getDatabasesPath(), 'record.db'),
        onCreate: (db, version) {
          return db.execute('''
            CREATE TABLE records(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT,
            content TEXT,
            type TEXT)
            ''');
        },
        version: 1,
      );
      return true;
    } catch (err) {
      print('dataConfig err : ${err.toString()}');
      return false;
    }
  }

  //C
  Future<bool> insertRecord(RecordModel record) async {
    final Database db = await database;

    try {
      db.insert(
        'records',
        record.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (err) {
      print('insert err : ${err.toString()}');
      return false;
    }
  }

  //R
  Future<List<RecordModel>> readRecords() async {
    final Database db = await database;
    final List<Map<String, dynamic>> data = await db.query('records');

    return List.generate(data.length, (i) {
      return RecordModel(
        id: data[i]['id'],
        date: data[i]['date'],
        content: data[i]['content'],
        type: data[i]['type'],
      );
    });
  }

  //필요우선순위 떨어짐
  //U
  //D
}
