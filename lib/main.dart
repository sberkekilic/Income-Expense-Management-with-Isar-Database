import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:isar/isar.dart';
import 'package:isar_database/collections/gider.dart';
import 'package:isar_database/collections/hesap.dart';
import 'package:isar_database/collections/kart.dart';
import 'package:isar_database/isar_service.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'collections/gelir.dart';
import 'pages/para-cek.dart';
import 'pages/para-yukle.dart';
import 'package:collection/collection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationSupportDirectory();
  if (dir.existsSync()) {
    // FIXME 2 : Isar will no longer create the provided directory. Make sure it exists before opening an Isar Instance.
    final isar = await Isar.open([KartSchema, HesapSchema, GelirSchema, GiderSchema]);
    runApp(MyApp(isar: isar));
  }
}

class MyApp extends StatelessWidget {
  final Isar isar;

  const MyApp({Key? key, required this.isar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(isar: isar),
    );
  }
}

class MainPage extends StatefulWidget {
  final Isar isar;
  void handleNavigatorPop() {
    print('Navigator popped');
  }
  const MainPage({Key? key, required this.isar}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Gider> giders = [];
  List<Gelir> gelirs = [];
  List<dynamic> transactions = [];
  var netgelir = {};
  var netgider = {};
  var netbakiye = 0; // SET IT TO 0 TO PREVENT DUPLICATE AT LIST.GENERATE THAT WE CREATED FOR GELIRS AND GIDERS DATABASES.
  var doublebakiye;
  int selectedIndex = -1;
  var sumGiders;
  var sumGelirs;
  var gelirDic = {};
  var giderDic = {};
  var gelirCevirDic = {};
  var giderCevirDic = {};


  readAllGiders() async {
    giders = await widget.isar.giders.where().findAll();
  }

  readAllGelirs() async {
    gelirs = await widget.isar.gelirs.where().findAll();
  }

  dicLoop() async {
    if (transactions.length == 0) {
      // ORDER BY DATETIME FOR LIST
      gelirs = await widget.isar.gelirs.where().findAll();
      giders = await widget.isar.giders.where().findAll();
      for (var x = 0; x < gelirs.length; x++) {
        gelirDic["gelir${x + 1}"] = int.parse(gelirs[x].amount!);
        sumGelirs = gelirDic.values.reduce((a, b) => a + b);
      }
      for (var x = 0; x < giders.length; x++) {
        giderDic["gider${x + 1}"] = int.parse(giders[x].amount!);
        sumGiders = giderDic.values.reduce((a, b) => a + b);
      }
      netbakiye = sumGelirs - sumGiders;
      doublebakiye = netbakiye
          .toDouble()
          .toStringAsFixed(2);
      setState(() {
        doublebakiye = doublebakiye;
      });// Converts to a string with 2 decimal places
    } else {
      print("dicLoop hata kısmı");
    }
  }

  void updateTransactionListAndNetBakiye() async {
    await dicLoop();
    setState(() {
      transactions.clear();
      transactions.addAll(gelirs);
      transactions.addAll(giders);
      transactions.sort((a, b) => a.myDateTime!.compareTo(b.myDateTime!));
    });
  }

  void updateTransactionListAndNetBakiyeCallback() {
    setState(() {
      updateTransactionListAndNetBakiye();
    });
  }


  // RUN THE  DICLOOP AND THEN TELL ME WHAT IS NETBAKIYE
  @override
  void initState() {
    super.initState();
    print("INTISTATE:ÇALIŞTIM");
    updateTransactionListAndNetBakiye();
  }

  Future<void> _updateDoubleBakiye() async {
    var value = await dicLoop();
    setState(() {
      doublebakiye = value.toDouble().toStringAsFixed(2);
    });
  }

  void handleNavigatorPop() {
    updateTransactionListAndNetBakiye();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.height,
            MediaQuery.of(context).size.height * 0.10),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.5,
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            padding: EdgeInsets.only(left: 25),
            alignment: Alignment.centerLeft,
            child: Text("Ana Menü",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text("Mevcut Bakiye",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w600)),
                      Text(
                        "$netbakiye₺",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 55,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                height: 36,
                width: 170,
                  child: ElevatedButton(
                    onPressed: () async{
                      var resultCek = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ParaCek(
                                isar: widget.isar,
                        ),
                      )
                      );
                      if (resultCek != null && resultCek) {
                        setState(() {
                          updateTransactionListAndNetBakiye();
                          print("Para çekme yazısı setstate");
                        });
                      }
                    },
                    child: Text("Para çek", style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Color(0xff253f50)),
                  ),
                ),
                SizedBox(width: 25),
                Container(
                  height: 36,
                  width: 170,
                  child: ElevatedButton(
                    onPressed: ()async {
                      var resultYukle = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ParaYukle(isar: widget.isar)),
                      );
                      await _updateDoubleBakiye();
                      if (resultYukle != null) {
                        setState(() {
                          transactions.addAll(gelirs);
                          transactions.addAll(giders);
                          transactions.sort((a, b) => a.myDateTime!.compareTo(b.myDateTime!));
                          doublebakiye = resultYukle.toDouble().toStringAsFixed(2);
                          print("Para yükle yazısı setstate");
                        });
                      }
                    },
                    child: Text("Para yükle", style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Color(0xff253f50)),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 50),
                  child: Row(
                    children: [
                      Icon(Icons.swap_vert),
                      Text("Son İşlemler",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 25),
                  child: Column(
                    children: transactions.map((transaction) {
                      return Padding(
                          padding: EdgeInsets.only(bottom: 16),
                          // Add spacing between transactions
                          child: Container(
                            color: Color(0xff253f50),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  height: 120,
                                  padding: EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Icon(
                                        transaction is Gelir
                                            ? Icons.arrow_circle_up
                                            : Icons.arrow_circle_down,
                                        color: transaction is Gelir
                                            ? Colors.green
                                            : Colors.red,
                                        size: 60,
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              transaction is Gelir
                                                  ? "Para Yükleme"
                                                  : "Para Çekme",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              transaction.bankName! + " hesabına",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Icon(Icons.schedule, size: 18, color: Colors.deepPurple,),
                                                SizedBox(width: 5),
                                                Text(
                                                  transaction.myDateTime
                                                          .toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.only(right: 35),
                                        child: Text(
                                          transaction is Gelir
                                          ? "+${transaction.amount!}₺"
                                        :"-${transaction.amount!}₺",
                                          style: TextStyle(
                                            color: transaction is Gelir
                                                ? Colors.green
                                                : Colors.red,
                                            fontSize: 23,
                                            fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
