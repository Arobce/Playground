import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseAccess {
  final databasePath = "";

  Future<List<Map>> getData() async {
    String dirloc = "";
    final String fileName = "sqlite.db";

    dirloc = (await getApplicationDocumentsDirectory()).path;

    String fullPath = dirloc + "/" + fileName;
    Database database = await openDatabase(fullPath, version: 1);

    List<Map> list = await database.rawQuery('SELECT * FROM products');
    print(list);
  }
}
