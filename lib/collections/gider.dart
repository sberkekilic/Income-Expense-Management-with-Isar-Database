import 'package:isar/isar.dart';
part 'gider.g.dart';

@collection
class Gider {
  Id id = Isar.autoIncrement;
  String? bankName;
  String? transactionTime;
  String? amount;
  DateTime? myDateTime;
}