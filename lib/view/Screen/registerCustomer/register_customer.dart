import 'package:dslsale/util/textstyle.dart';
import 'package:dslsale/view/widget/text_formfield.dart';
import 'package:flutter/material.dart';

class RegisterCustoScreen extends StatefulWidget {
  const RegisterCustoScreen({super.key});

  @override
  State<RegisterCustoScreen> createState() => _RegisterCustoScreenState();
}

class _RegisterCustoScreenState extends State<RegisterCustoScreen> {
  DateTime _selectedDate = DateTime.now();

  //=============== function DateTime ===========

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2500),
    );
    if (picked != null && picked != _selectedDate)
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        //===================== header =================
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text("ລົງທະບຽນສຳເລັດ"),
                    action: SnackBarAction(label: "Undo", onPressed: () {}),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(
                  Icons.cloud_done_outlined,
                  color: Colors.black,
                  size: 25,
                ))
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
            icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          title: const Text(
            "ລົງທະບຽນລູກຄ້າ",
            style: textTitle,
          ),
          backgroundColor: Colors.white,
        ),

        //=============== content body ======================
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(children: [
              TextFieldWidget(
                width: MediaQuery.of(context).size.width / 1.2,
                text: 'ຊື່ ແລະ ນາມສະກຸນ :',
                keyboardType: TextInputType.text,
              ),
              TextFieldWidget(
                width: MediaQuery.of(context).size.width / 1.2,
                text: 'ເບີໂທ :',
                keyboardType: TextInputType.text,
              ),
              TextFieldWidget(
                  width: MediaQuery.of(context).size.width / 1.2,
                  text: 'ອາຍຸ :',
                  keyboardType: TextInputType.number),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: Text(
                              'ເລືອກວັນເດືອນປີເກີດ${_selectedDate.toLocal()}'
                                  .split(' ')[0]),
                        ),
                      ],
                    ),
                    // TimePickerSpinnerPopUp(
                    //   textStyle: const TextStyle(
                    //       color: Colors.grey, fontWeight: FontWeight.bold),
                    //   mode: CupertinoDatePickerMode.date,
                    //   initTime: DateTime.now(),
                    //   minTime:
                    //       DateTime.now().subtract(const Duration(days: 10)),
                    //   maxTime: DateTime.now().add(const Duration(days: 10)),
                    //   barrierColor:
                    //       Colors.black12, //Barrier Color when pop up show
                    //   minuteInterval: 1,
                    //   cancelText: 'Cancel',
                    //   confirmText: 'OK',
                    //   pressType: PressType.singlePress,
                    //   timeFormat: 'yyyy/MM/dd',

                    //   onChange: (dateTime) {
                    //     // Implement your logic with select dateTime
                    //   },
                    // ),
                  ],
                ),
              ),
              TextFieldWidget(
                  width: MediaQuery.of(context).size.width / 1.2,
                  text: 'ບ້ານຢູ່ປະຈຸບັນ :',
                  keyboardType: TextInputType.text),
              TextFieldWidget(
                  width: MediaQuery.of(context).size.width / 1.2,
                  text: 'ແຂວງ :',
                  keyboardType: TextInputType.text),
              TextFieldWidget(
                  width: MediaQuery.of(context).size.width / 1.2,
                  text: 'ເມືອງ :',
                  keyboardType: TextInputType.text),
              TextFieldWidget(
                  width: MediaQuery.of(context).size.width / 1.2,
                  text: 'ຫນ່ວຍ :',
                  keyboardType: TextInputType.number),
              TextFieldWidget(
                  width: MediaQuery.of(context).size.width / 1.2,
                  text: 'ເຮືອນເລກທີ :',
                  keyboardType: TextInputType.number),
              TextFieldWidget(
                  width: MediaQuery.of(context).size.width / 1.2,
                  text: 'ຊື່ຮ້ານ :',
                  keyboardType: TextInputType.text),
              TextFieldWidget(
                  width: MediaQuery.of(context).size.width / 1.2,
                  text: 'ສະຖານທີ່ຮ້ານຕັ້ງຢູ່ບ້ານ :',
                  keyboardType: TextInputType.text),
              TextFieldWidget(
                  width: MediaQuery.of(context).size.width / 1.2,
                  text: 'ແຂວງ :',
                  keyboardType: TextInputType.text),
              TextFieldWidget(
                  width: MediaQuery.of(context).size.width / 1.2,
                  text: 'ເມືອງ :',
                  keyboardType: TextInputType.text),
              TextFieldWidget(
                  width: MediaQuery.of(context).size.width / 1.2,
                  text: 'ຫນ່ວຍ :',
                  keyboardType: TextInputType.number),
              TextFieldWidget(
                  width: MediaQuery.of(context).size.width / 1.2,
                  text: 'ເຮືອນເລກທີ :',
                  keyboardType: TextInputType.number),
            ]),
          ),
        ),
      ),
    );
  }
}
