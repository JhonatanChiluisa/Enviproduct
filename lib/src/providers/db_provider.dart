import 'dart:io';
import 'package:application_enviproduct_v01/src/models/provedores_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
class DBProvider {
  static Database? _database;
  static final DBProvider dbProvider = DBProvider._();
  DBProvider._();

  Future<Database?>? get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  Future<Database> initDb() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    final path = join(appDir.path, 'Enviproducts.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE Proveedores (
          id  INTEGER PRIMARY KEY,
          tipo  INTEGER,
          nombre TEXT,
          localizacion TEXT,          
          contacto TEXT          
        )      
      ''');
    });
  }

    Future<int> insert(Proveedor newElement) async {
    //INSERT INTO Proveedores VALUES
    final Database? db = await database;
    final newId = await db!.insert('Proveedores', newElement.toJson());
    return newId;
  }

   
   Future<List<Proveedor>> list() async {
    //SELECT * FROM Insumo
    final Database? db = await database;
    final result = await db!.query('Proveedores');
    return result.isNotEmpty
        ? result.map((t) => Proveedor.fromJson(t)).toList()
        : [];
  }
}
