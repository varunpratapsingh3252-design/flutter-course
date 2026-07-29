import 'package:hive/hive.dart';

part 'student.g.dart';

@HiveType(typeId: 0)
class Student extends HiveObject {

  @HiveField(0)
  String name;

  @HiveField(1)
  String course;

  @HiveField(2)
  int age;

  Student({
    required this.name,
    required this.course,
    required this.age,
  });
}