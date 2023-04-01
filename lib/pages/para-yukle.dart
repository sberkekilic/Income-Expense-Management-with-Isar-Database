import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../collections/hesap.dart';
import 'hesap-yonetim.dart';

class ParaYukle extends StatefulWidget {
  final Isar isar;
  const ParaYukle({Key? key, required this.isar}) : super(key: key);

  @override
  State<ParaYukle> createState() => _ParaYukleState();
}

class  _ParaYukleState extends State<ParaYukle> {
  List<Hesap> hesaps = [];

  addHesap(String accountName, String ibanNumber) async {
    Hesap  newHesap = Hesap()
      ..accountName = accountName
      ..ibanNumber = ibanNumber;

    await widget.isar.writeTxn(() async {
      var addedID = await widget.isar.hesaps.put(newHesap);
      print(addedID);
    });
  }

  editHesap(int id, String accountName, String ibanNumber) async {
    Hesap  newHesap = Hesap()
     ..id = id
      ..accountName = accountName
      ..ibanNumber = ibanNumber;

    await widget.isar.writeTxn(() async {
      var addedID = await widget.isar.hesaps.put(newHesap);
      print(addedID);
    });
  }

  deleteHesap(int id) async {
    widget.isar.writeTxn(() async {
      var result = await widget.isar.hesaps.delete(id);
      if (result) {
        print("Silindi.");
        readAllHesaps();
      } else {
        print("Silinemedi.");
      }
    });
  }

  readAllHesaps() async{
    hesaps = await widget.isar.hesaps.where().findAll();
    setState(() {
    });
  }

  openConnection() async {
    try {
      final isar = await Isar.open([HesapSchema]);
      if (widget.isar.isOpen) {
        print("Veritabanına bağlandı.");
        readAllHesaps();
      } else {
        print("Bağlantı başarısız.");
      }
    } catch (e) {
      print("OpenConnectionError: ");
      print(e);
    }

  }

  closeConnection() async {
    try {
      readAllHesaps();
      var result = await widget.isar.close();
      if(result){
        print("Bağlantı sona erdi.");
      } else {
        print("Bağlantı kapatılamadı.");
      }
    } catch (e) {
      print("CloseConnectionError: ");
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    readAllHesaps();
    print("Yedek initstate");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back), color: Colors.black),
        title: const Text('Para yükleme',style: TextStyle(color: Colors.black, fontSize: 24)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () async{
            var result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => HesapYonetim(isar: widget.isar)),
            );
            if(result != null && result){
              setState(() {
                readAllHesaps();
                print("Hesap Yönetim yazısı setstate");
              });
            }
          },
            child: Text(
                "Hesap Yönetim", style: TextStyle(
                fontSize: 14)),
            style: ElevatedButton.styleFrom(
                primary: Color(0xff253f50),
                onPrimary: Colors.white),
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: hesaps
                      .map(
                        (e) => Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red, width: 4)
                      ),
                      child: Column(
                        children: [
                          Align(
                            child: Text(
                                e.accountName!
                            ),
                            alignment: Alignment.topLeft,
                          ),
                          Align(
                              child: Text(
                                  e.ibanNumber!
                              ),
                              alignment: Alignment.bottomLeft
                          ),
                        ],
                      ),
                    ),
                  ).toList(),
                ),
              )
          )
        ],
      ),
    );
  }
}
