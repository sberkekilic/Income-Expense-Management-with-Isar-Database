import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:isar/isar.dart';
import 'package:isar_database/pages/para-cek.dart';

import '../collections/hesap.dart';
import '../isar_service.dart';

class HesapYonetim extends StatefulWidget {
  final Isar isar;
  const HesapYonetim({Key? key, required this.isar}) : super(key: key);

  @override
  State<HesapYonetim> createState() => _HesapYonetimState();
}

class _HesapYonetimState extends State<HesapYonetim>{
  List<Hesap> hesaps = [];
  Hesap? dropdownValue;
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
  final TextEditingController _ibanController = TextEditingController();

  addHesap() async {
    final hesapCollection = widget.isar.hesaps;
    final newHesap = Hesap()
      ..bankName = dropdownBank
      ..ibanNumber = _ibanController.text;
    //FIXME 4: Removed isar parameter from Isar.writeTxn()
    await widget.isar.writeTxn(() async {
      await hesapCollection.put(newHesap);
    });

    _ibanController.clear();
    setState(() {
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readHesap();
    print("Hesap-yonetim initstate");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hesap Yönetim',style: TextStyle(color: Colors.black, fontSize: 24)),
          backgroundColor: Colors.white,
          leading:  IconButton(
            onPressed: () async{
              Navigator.pop(context, true);
            },
            icon:  Icon(Icons.arrow_back_rounded, color: Colors.black,),
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
              Text("IBAN"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 4, color: Colors.black)),
                ),
                controller: _ibanController,
              ),
              Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: () {
                        addHesap();
                      },
                      child: const Text("Add"))),
            ],
          ),
        )
    );
  }

  _readHesap() async {
    final hesapCollection = widget.isar.hesaps;
    final getHesaps = await hesapCollection.where().findAll();
    setState(() {
      hesaps = getHesaps;
    });
  }

  readAllHesaps() async{
    hesaps = await widget.isar.hesaps.where().findAll();
    setState(() {

    });
  }


}

