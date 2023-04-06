import 'package:sqflite/sqflite.dart';

abstract class Migration {
  void create(Batch batch);
  void update(Batch batch);
  void delete(Batch batch);
}
