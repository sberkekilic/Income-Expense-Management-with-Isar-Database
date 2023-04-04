import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_database/collections/kart.dart';
import 'package:intl/intl.dart';
import '../collections/gider.dart';
import 'kart-yonetim.dart';

class ParaCek extends StatefulWidget {
  final Isar isar;

  const ParaCek({Key? key, required this.isar}) : super(key: key);

  @override
  State<ParaCek> createState() => _ParaCekState();
}

class _ParaCekState extends State<ParaCek> {
   int selectedIndex = -1;
  List<Kart> karts = [];
  String kartadi = "";
  DateFormat dateFormat = DateFormat("dd.MM.yyyy HH:mm:ss");
  late String transactionTime = dateFormat.format(DateTime.now());
  final TextEditingController _amountController = TextEditingController();

  addGider() async {
    final giderCollection = widget.isar.giders;
    final newGider = Gider()
      ..amount = _amountController.text
      ..bankName = kartadi
      ..transactionTime = transactionTime;
    //FIXME 4: Removed isar parameter from Isar.writeTxn()
    await widget.isar.writeTxn(() async {
      await giderCollection
        ..put(newGider);
    });

    _amountController.clear();
    setState(() {});
  }

  addCard(
      String cardName, String cardOwner, String cardNumber, String skt) async {
    Kart newCard = Kart()
      ..cardName = cardName
      ..cardOwner = cardOwner
      ..cardNumber = cardNumber
      ..skt = skt;

    await widget.isar.writeTxn(() async {
      var addedID = await widget.isar.karts.put(newCard);
      print(addedID);
    });
  }

  editCard(int id, String cardName, String cardOwner, String cardNumber,
      String skt) async {
    Kart newCard = Kart()
      ..id = id
      ..cardName = cardName
      ..cardOwner = cardOwner
      ..cardNumber = cardNumber
      ..skt = skt;

    await widget.isar.writeTxn(() async {
      var addedID = await widget.isar.karts.put(newCard);
      print(addedID);
    });
  }

  deleteCard(int id) async {
    widget.isar.writeTxn(() async {
      var result = await widget.isar.karts.delete(id);
      if (result) {
        print("Silindi.");
        readAllCards();
      } else {
        print("Silinemedi.");
      }
    });
  }

  readAllCards() async {
    karts = await widget.isar.karts.where().findAll();
    setState(() {});
  }

  test(Kart kart) async {
    Kart updatedKart = kart;
    updatedKart.select = !updatedKart.select;

    await widget.isar.writeTxn(() async {
      await widget.isar.karts.put(updatedKart);
      readAllCards();
    });
  }

  openConnection() async {
    try {
      final isar = await Isar.open([KartSchema]);
      if (widget.isar.isOpen) {
        print("Veritabanına bağlandı.");
        readAllCards();
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
      readAllCards();
      var result = await widget.isar.close();
      if (result) {
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
    readAllCards();
    print("Para-cek initstate");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black),
        title: const Text('Para çekme',
            style: TextStyle(color: Colors.black, fontSize: 24)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              var result = await Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => KartYonetim(isar: widget.isar)),
              );
              if (result != null && result) {
                setState(() {
                  readAllCards();
                  print("Kart Yönetim yazısı setstate");
                });
              }
            },
            child: Text("Kart Yönetim", style: TextStyle(fontSize: 14)),
            style: ElevatedButton.styleFrom(
                primary: Color(0xff253f50), onPrimary: Colors.white),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children:
                    List.generate(karts.length, (index){
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
                                    title: Text(karts[index].cardName!+" "+karts[index].cardOwner!),
                                    subtitle: Text(karts[index].cardNumber!+" "+karts[index].skt!),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        ElevatedButton(
                                            onPressed: (){
                                              selectedIndex = index;
                                              kartadi = karts[index].cardOwner!;
                                              setState(() {
                                                test(karts[index]);
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
                    }),

                  ),
                  Text("Seçildi: $kartadi"),
                  Text("Çekmek istediğin tutar"),
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
                            addGider();
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
