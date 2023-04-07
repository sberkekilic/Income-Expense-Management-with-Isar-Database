import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_database/collections/kart.dart';
import 'package:intl/intl.dart';
import '../collections/gider.dart';
import '../main.dart';
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
  DateTime now = DateTime.now();
  late String formattedDate = DateFormat('dd.MM.yyyy').format(now);
  late DateTime formattedDateTime =
      DateFormat('dd.MM.yyyy').parse(formattedDate);
  final TextEditingController _amountController = TextEditingController();

  addGider() async {
    final giderCollection = widget.isar.giders;
    final newGider = Gider()
      ..amount = _amountController.text
      ..bankName = kartadi
      ..myDateTime = formattedDateTime;
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
    final cardCollection = widget.isar.karts;
    final getCards = await cardCollection.where().findAll();
    setState(() {
      karts = getCards;
    });
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
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () async {
                      Navigator.pop(context,true);
                    }
                    ),
                SizedBox(width: 12),
                Text("Para çekme",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
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
                foregroundColor: Colors.white, backgroundColor: Color(0xff253f50)),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Wrap(
                    direction: Axis.horizontal,
                    children: List.generate(karts.length, (index) {
                      return InkWell(
                        onTap: () {
                          selectedIndex = index;
                          kartadi = karts[index].cardName!;
                          setState(() {
                            test(karts[index]);
                          });
                        },
                        child: Container(
                            child: Card(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  title: Text(karts[index].cardName! +
                                      " " +
                                      karts[index].cardOwner!),
                                  subtitle: Text(karts[index].cardNumber! +
                                      " " +
                                      karts[index].skt!),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    ElevatedButton(
                                        onPressed: () {
                                          selectedIndex = index;
                                          kartadi = karts[index].cardName!;
                                          setState(() {
                                            test(karts[index]);
                                          });
                                        },
                                        child: selectedIndex == index
                                            ? Text("checked")
                                            : Text("uncheck")),
                                  ],
                                )
                              ]),
                        )),
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
                          child: const Text("Para çek"))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  }

