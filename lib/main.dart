import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:isar_database/collections/gider.dart';
import 'package:isar_database/collections/hesap.dart';
import 'package:isar_database/collections/kart.dart';
import 'package:isar_database/isar_service.dart';
import 'package:path_provider/path_provider.dart';

import 'collections/gelir.dart';
import 'pages/para-cek.dart';
import 'pages/para-yukle.dart';

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
  const MainPage({super.key, required this.isar});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Hesap> hesaps = [];
  readAllHesaps() async{
    hesaps = await widget.isar.hesaps.where().findAll();
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    readAllHesaps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Ana Menü", style: TextStyle(color: Colors.black, fontSize: 24)),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Center(child: Text("Mevcut Bakiye", style: TextStyle(color: Colors.black, fontSize: 20))),
           Column(
                    children: hesaps
                        .map(
                          (e) => Container(
                        child: Column(
                          children: [
                            Align(
                                child: Text(
                                    e.ibanNumber!
                                ),
                                alignment: Alignment.center
                            ),
                          ],
                        ),
                      ),
                    ).toList(),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ParaCek(isar: widget.isar)),
                  );
                },
                  child: Text(
                      "Para çek", style: TextStyle(
                      fontSize: 14)),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff253f50),
                      onPrimary: Colors.white),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  ParaYukle(isar: widget.isar)),
                  );
                },
                  child: Text(
                      "Para yükle", style: TextStyle(
                      fontSize: 14)),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff253f50),
                      onPrimary: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}






