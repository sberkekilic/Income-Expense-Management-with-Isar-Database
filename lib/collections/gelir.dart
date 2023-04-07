import 'package:isar/isar.dart';
part 'gelir.g.dart';

@collection
class Gelir {
  Id id = Isar.autoIncrement;
  String? bankName;
  String? transactionTime;
  String? amount;
  DateTime? myDateTime;
}