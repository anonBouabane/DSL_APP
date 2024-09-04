import 'package:dslsale/data/data_dump.dart';
import 'package:dslsale/util/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailCustomer extends StatefulWidget {
  const DetailCustomer({
    super.key,
    required this.index,
    required this.fullName,
    required this.gender,
    required this.age,
    required this.address,
    required this.phone,
  });
  final int index;
  final String fullName;
  final String gender;
  final String age;
  final String address;
  final String phone;
  @override
  State<DetailCustomer> createState() => _DetailCustomerState();
}

class _DetailCustomerState extends State<DetailCustomer> {
  final datadump = Data();
  final _fullNameCotroller = TextEditingController();
  final _genderController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    _fullNameCotroller.text = widget.fullName;
    _genderController.text = widget.gender;
    _ageController.text = widget.age;
    _addressController.text = widget.address;
    _phoneController.text = widget.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _readOnly = !_readOnly;
                    });
                  },
                  icon: Icon(
                    _readOnly ? Icons.edit : Icons.save,
                    color: Colors.white,
                  ))
            ],
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            title: const Text(
              "ລາຍລະອຽດຂໍ້ມູນລູກຄ້າ",
              style: textTitlewhite,
            ),
            backgroundColor: Colors.blueAccent,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 5),
            child: Card(
              color: const Color.fromARGB(255, 229, 239, 240),
              child: Form(
                key: _formkey,
                child: Consumer<Data>(
                  builder: (context, value, child) {
                    // final data = value.infocusto;
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 50),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  controller: _fullNameCotroller,
                                  style: textTitle,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      label: Text('fullName')),
                                  readOnly: _readOnly),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  controller: _genderController,
                                  style: textTitle,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      label: Text('gender')),
                                  readOnly: _readOnly),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  controller: _ageController,
                                  style: textTitle,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      label: Text('age')),
                                  readOnly: _readOnly),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  controller: _addressController,
                                  style: textTitle,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      label: Text('address')),
                                  readOnly: _readOnly),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  controller: _phoneController,
                                  style: textTitle,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      label: Text('phone')),
                                  readOnly: _readOnly),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 30, 177, 222),
                                          shadowColor: Colors.black,
                                          elevation: 10,
                                          overlayColor: Colors.red),
                                      onPressed: () {},
                                      child: const Text(
                                        'ບັນທຶກ',
                                        style: textTitlewhite,
                                      )),
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )),
    );
  }

  bool _readOnly = true;
}
