import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:isar/isar.dart';
import 'package:isar_database/pages/para-cek.dart';

import '../collections/kart.dart';
import '../isar_service.dart';

class KartYonetim extends StatefulWidget {
  final Isar isar;
  const KartYonetim({Key? key, required this.isar}) : super(key: key);

  @override
  State<KartYonetim> createState() => _KartYonetimState();
}

class _KartYonetimState extends State<KartYonetim> {
  List<Kart> karts = [];
  Kart? dropdownValue;
  List<String> banks = [
    "Akbank",
    "DenizBank",
    "Fibabanka",
    "Garanti BBVA",
    "Halkbank",
    "HSBC",
    "ING",
    "Odeabank",
    "QNB Finansbank",
    "TEB",
    "Türkiye İş Bankası",
    "Vakıfbank",
    "Yapı Kredi",
    "Ziraat Bankası"
  ];
  String dropdownBank = "Akbank";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ownerController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _sktController = TextEditingController();

  addKart() async {
    final kartCollection = widget.isar.karts;
    final newKart = Kart()
      ..skt = _sktController.text
      ..cardNumber = _numberController.text
      ..cardOwner = _ownerController.text
      ..cardName = dropdownBank;
    //FIXME 4: Removed isar parameter from Isar.writeTxn()
    await widget.isar.writeTxn(() async {
      await kartCollection.put(newKart);
    });

    _nameController.clear();
    _ownerController.clear();
    _numberController.clear();
    _sktController.clear();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readCard();
    print("Kart-yonetim initstate");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kart Yönetim',
              style: TextStyle(color: Colors.black, fontSize: 24)),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () async {
              Navigator.pop(context, true);
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Bank Name"),
              SizedBox(
                child: DropdownButton(
                  isExpanded: true,
                  value: dropdownBank,
                  icon:  Icon(Icons.keyboard_arrow_down),
                  items: banks
                      .map<DropdownMenuItem<String>>((String bank) {
                    return DropdownMenuItem<String>(
                        value: bank, child: Text(bank));
                  }).toList(),
                  onChanged: (String? newBank) {
                    setState(() {
                      dropdownBank = newBank!;
                    });
                  },
                ),
              ),
              Text("Owner"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 4, color: Colors.black)),
                ),
                controller: _ownerController,
              ),
              Text("Number"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 4, color: Colors.black)),
                ),
                controller: _numberController,
              ),
              Text("SKT"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 4, color: Colors.black)),
                ),
                controller: _sktController,
              ),
              Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () {
                        addKart();
                      },
                      child: const Text("Add"))),
            ],
          ),
        ));
  }

  _readCard() async {
    final cardCollection = widget.isar.karts;
    final getCards = await cardCollection.where().findAll();
    setState(() {
      karts = getCards;
    });
  }

  readAllCards() async {
    karts = await widget.isar.karts.where().findAll();
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
}
