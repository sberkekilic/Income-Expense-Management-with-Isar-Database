import 'package:isar/isar.dart';
part 'kart.g.dart';

@collection
class Kart {
  Id id = Isar.autoIncrement;
  String? cardName;
  String? cardOwner;
  String? cardNumber;
  String? skt;
  bool select = false;
}