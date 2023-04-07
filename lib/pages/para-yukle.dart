import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';
import 'package:isar_database/collections/gelir.dart';

import '../collections/hesap.dart';
import 'hesap-yonetim.dart';

class ParaYukle extends StatefulWidget {
  final Isar isar;
  const ParaYukle({Key? key, required this.isar}) : super(key: key);

  @override
  State<ParaYukle> createState() => _ParaYukleState();
}

class  _ParaYukleState extends State<ParaYukle> {
  int selectedIndex = -1;
  List<Hesap> hesaps = [];
  String hesapadi = "";
  DateTime now = DateTime.now();
  late String formattedDate = DateFormat('dd.MM.yyyy').format(now);
  late DateTime formattedDateTime = DateFormat('dd.MM.yyyy').parse(formattedDate);
  final TextEditingController _amountController = TextEditingController();

  addGelir() async {
    final gelirCollection = widget.isar.gelirs;
    final newGelir = Gelir()
      ..amount = _amountController.text
      ..bankName = hesapadi
      ..myDateTime = formattedDateTime;
    await widget.isar.writeTxn(() async {
     await gelirCollection..put(newGelir);
    });
  }

  addHesap(
      String bankName, String ibanNumber) async {
    Hesap  newHesap = Hesap()
      ..bankName = bankName
      ..ibanNumber = ibanNumber;

    await widget.isar.writeTxn(() async {
      var addedID = await widget.isar.hesaps.put(newHesap);
      print(addedID);
    });
  }

  editHesap(int id, String bankName, String ibanNumber) async {
    Hesap  newHesap = Hesap()
     ..id = id
      ..bankName = bankName
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

  test(Hesap hesap) async {
    Hesap updatedHesap = hesap;
    updatedHesap.select = !updatedHesap.select;

    await widget.isar.writeTxn(() async {
      await widget.isar.hesaps.put(updatedHesap);
      readAllHesaps();
    });
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
        leading: IconButton(onPressed: ()async{
          Navigator.pop(context, true);
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
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children:
                    List.generate(hesaps.length, (index){
                      return InkWell(
                        onTap: (){
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                            child: Card(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children:
                                  <Widget>[
                                    ListTile(
                                      title: Text(hesaps[index].bankName!),
                                      subtitle: Text(hesaps[index].ibanNumber!),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        ElevatedButton(
                                            onPressed: (){
                                              selectedIndex = index;
                                              hesapadi = hesaps[index].bankName!;
                                              setState(() {
                                                test(hesaps[index]);
                                              });
                                            },
                                            child: selectedIndex == index?Text("checked"): Text("uncheck")),
                                      ],
                                    )
                                  ]
                              ),
                            )
                        ),
                      );
                    }
                    ),
                  ),
                  Text("Seçildi: $hesapadi"),
                  Text("Yüklemek  istediğin tutar"),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                          BorderSide(width: 4, color: Colors.black)),
                    ),
                    controller: _amountController,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          onPressed: () {
                            addGelir();
                          },
                          child: const Text("Add"))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
