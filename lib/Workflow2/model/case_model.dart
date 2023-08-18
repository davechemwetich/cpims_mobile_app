import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Case extends HiveObject {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String name;

  // Other fields...

  Case(this.id, this.name);
}
