import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_database/collections/kart.dart';

import '../collections/gider.dart';
import 'kart-yonetim.dart';

class ParaCek extends StatefulWidget {
  final Isar isar;
  const ParaCek({Key? key, required this.isar}) : super(key: key);

  @override
  State<ParaCek> createState() => _ParaCekState();
}

class  _ParaCekState extends State<ParaCek> {
  List<Kart> karts = [];
  final TextEditingController _amountController = TextEditingController();

  addGider() async {
    final giderCollection = widget.isar.giders;
    final newGider = Gider()
      ..amount = _amountController.text;
    //FIXME 4: Removed isar parameter from Isar.writeTxn()
    await widget.isar.writeTxn(() async {
      await giderCollection.put(newGider);
    });

    _amountController.clear();
    setState(() {
    });
  }
  addCard(String cardName, String cardOwner, String cardNumber, String skt) async {
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

  editCard(int id, String cardName, String cardOwner, String cardNumber, String skt) async {
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

  readAllCards() async{
    karts = await widget.isar.karts.where().findAll();
    setState(() {

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
    readAllCards();
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
        title: const Text('Para çekme',style: TextStyle(color: Colors.black, fontSize: 24)),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: () async{
            var result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => KartYonetim(isar: widget.isar)),
            );
            if(result != null && result){
              setState(() {
                readAllCards();
                print("Kart Yönetim yazısı setstate");
              });
            }
          },
            child: Text(
                "Kart Yönetim", style: TextStyle(
                fontSize: 14)),
            style: ElevatedButton.styleFrom(
                primary: Color(0xff253f50),
                onPrimary: Colors.white),
          ),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: karts
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
                              Align(child: Text(e.cardName!),
                                alignment: Alignment.topLeft,
                              ),
                              Align(child: Text(e.cardOwner!),
                                  alignment: Alignment.topRight
                              ),
                              Align(child: Text(e.cardNumber!),
                                  alignment: Alignment.bottomLeft
                              ),
                              Align(child: Text(e.skt!),
                                  alignment: Alignment.bottomRight
                              ),
                            ],
                          ),
                        ),
                      ).toList(),
                    ),
                    Text("Çekmek istediğin tutar"),
                    TextFormField(
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
              )
          )
        ],
      ),
    );
  }
}
