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
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ibanController = TextEditingController();

  addHesap() async {
    final hesapCollection = widget.isar.hesaps;
    final newHesap = Hesap()
      ..accountName = _nameController.text
      ..ibanNumber = _ibanController.text;
    //FIXME 4: Removed isar parameter from Isar.writeTxn()
    await widget.isar.writeTxn(() async {
      await hesapCollection.put(newHesap);
    });

    _nameController.clear();
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
              Text("Name"),
              TextFormField(
                controller: _nameController,
              ),
              Text("IBAN"),
              TextFormField(
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

