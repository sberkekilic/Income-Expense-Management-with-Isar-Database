import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_database/collections/gelir.dart';
import 'package:isar_database/collections/gider.dart';
import 'package:isar_database/collections/hesap.dart';
import 'package:isar_database/collections/kart.dart';
import 'main.dart';

class IsarService {
  late Future<Isar> db;

  IsarService(){
    db = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty){
      return await Isar.open(
        [GelirSchema, GiderSchema, HesapSchema, KartSchema],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }
  //KART EKLEMEK
  Future<void> createCard(Kart newCard) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.karts.putSync(newCard));
  }
  //HESAP EKLEMEK
  Future<void> createAccount(Hesap newAccount) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.hesaps.putSync(newAccount));
  }
  //GELİR EKLEMEK
  Future<void> createIncome(Gelir newIncome) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.gelirs.putSync(newIncome));
  }
  //GİDER EKLEMEK
  Future<void> createExpense(Gider newExpense) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.giders.putSync(newExpense));
  }
  //TÜM KARTLARI LİSTELE
  Future<List<Kart>> getAllCards() async {
    final isar = await db;
    return isar.karts.where().findAll();
  }
  //TÜM HESAPLARI LİSTELE
  Future<List<Hesap>> getAllAccounts() async {
    final isar = await db;
    return isar.hesaps.where().findAll();
  }
  //TÜM GELİRLERİ LİSTELE
  Future<List<Gelir>> getAllIncomes() async {
    final isar = await db;
    return isar.gelirs.where().findAll();
  }
  //TÜM GİDERLERİ LİSTELE
  Future<List<Gider>> getAllExpenses() async {
    final isar = await db;
    return isar.giders.where().findAll();
  }
  //TÜM DATABASE'İ SİL
  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Future<Kart?>> anan() async {
    final isar = await db;
    final nu = Kart()..cardName = 'oha';
    return isar.karts.get(nu.id);
  }

}