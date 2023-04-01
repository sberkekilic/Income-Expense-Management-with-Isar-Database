import 'package:isar/isar.dart';
part 'hesap.g.dart';

@collection
class Hesap {
  Id id = Isar.autoIncrement;
  String? accountName;
  String? ibanNumber;
}