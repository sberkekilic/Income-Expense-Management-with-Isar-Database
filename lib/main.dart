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
    final isar =
        await Isar.open([KartSchema, HesapSchema, GelirSchema, GiderSchema]);

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

  const MainPage({super.key, required this.isar});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Gider>? giderss;
  List<Gider> giders = [];
  List str = [];
  int selectedIndex = -1;

  readAllGiders() async {
    giders = await widget.isar.giders.where().findAll();
  }

  @override
  void initState() {
    super.initState();
    readAllGiders();
  }

  @override
  Widget build(BuildContext context) {
    var a = giders[0].amount!;
    var b = giders[1].amount!;
    var c = int.parse(a);
    var d = int.parse(b);
    int bakiye = c + d;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Ana Menü",
            style: TextStyle(color: Colors.black, fontSize: 24)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Center(
                  child: Text("Mevcut Bakiye",
                      style: TextStyle(color: Colors.black, fontSize: 20))),
              Text(bakiye.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 50)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ParaCek(isar: widget.isar)),
                      );
                    },
                    child: Text("Para çek", style: TextStyle(fontSize: 14)),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff253f50), onPrimary: Colors.white),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ParaYukle(isar: widget.isar)),
                      );
                    },
                    child: Text("Para yükle", style: TextStyle(fontSize: 14)),
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xff253f50), onPrimary: Colors.white),
                  ),
                ],
              ),
               Column(
                    children: [
                      Wrap(
                        direction: Axis.horizontal,
                        children: List.generate(giders.length, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                                child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 20),
                                        ListTile(
                                          title: Text("Para Çekme"),
                                          subtitle: Text(giders[index]
                                              .bankName! +
                                              "  hesabına" +
                                              giders[index].transactionTime!),
                                          trailing: Text(giders[index].amount!),
                                          isThreeLine: true,
                                        ),
                                      ]),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
