import 'package:dslsale/data/data_dump.dart';
import 'package:dslsale/util/images.dart';
import 'package:dslsale/util/textstyle.dart';
import 'package:flutter/material.dart';


class PaymentDetailScreen extends StatefulWidget {
  const PaymentDetailScreen({super.key});

  @override
  State<PaymentDetailScreen> createState() => _PaymentDetailScreenState();
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
  final data = Data();
  int _selectValue = 0;
  int _selectCurrency = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //================= header =================//

        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'ຊຳລະ',
            style: textTitlewhite,
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              )),
        ),

        //================= content body =================//

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  //================= image =================//

                  child: Image.asset(Images.qr),
                ),
                const Text(
                  'Anon BouaBane',
                  style: textTitleGrey,
                ),
                const Text(
                  '100-12-00-123-123-123',
                  style: textSimplegrey,
                ),

                //================= RadiO check payment =================//

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'ເງິນສົດ',
                      style: textSimplegrey,
                    ),
                    Radio(
                      value: 1,
                      groupValue: _selectValue,
                      onChanged: (int? value) {
                        setState(() {
                          _selectValue = value!;
                        });
                      },
                    ),
                    const Text(
                      'ເງິນໂອນ',
                      style: textSimplegrey,
                    ),
                    Radio(
                      value: 2,
                      groupValue: _selectValue,
                      onChanged: (int? value) {
                        setState(() {
                          _selectValue = value!;
                        });
                      },
                    ),
                    const Text(
                      'ຄ້າງຊຳລະ',
                      style: textSimplegrey,
                    ),
                    Radio(
                      value: 3,
                      groupValue: _selectValue,
                      onChanged: (int? value) {
                        setState(() {
                          _selectValue = value!;
                        });
                      },
                    ),
                  ],
                ),

                //=============== RadiO currency =============
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'LAK',
                      style: textSimplegrey,
                    ),
                    Radio(
                      value: 1,
                      groupValue: _selectCurrency,
                      onChanged: (int? value) {
                        setState(() {
                          _selectCurrency = value!;
                        });
                      },
                    ),
                    const Text(
                      'THB',
                      style: textSimplegrey,
                    ),
                    Radio(
                      value: 2,
                      groupValue: _selectCurrency,
                      onChanged: (int? value) {
                        setState(() {
                          _selectCurrency = value!;
                        });
                      },
                    ),
                    const Text(
                      'CNY',
                      style: textSimplegrey,
                    ),
                    Radio(
                      value: 3,
                      groupValue: _selectCurrency,
                      onChanged: (int? value) {
                        setState(() {
                          _selectCurrency = value!;
                        });
                      },
                    ),
                  ],
                ),

                //============= list view  order ==============//

                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 20),
                      child: SizedBox(
                        height: 80,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'ສິນຄ້າ : ',
                                      style: textSimplegrey,
                                    ),
                                    const Spacer(),
                                    Text(
                                      data.gridMap[index]['title'],
                                      style: textSimplegrey,
                                    )
                                  ],
                                ),
                                const Row(
                                  children: [
                                    Text(
                                      'ຈຳນວນ : ',
                                      style: textSimplegrey,
                                    ),
                                    Spacer(),
                                    Text(
                                      '12',
                                      style: textSimplegrey,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'ລາຄາ : ',
                                      style: textSimplegrey,
                                    ),
                                    const Spacer(),
                                    Text(
                                      ' ${data.gridMap[index]['price']} LAK',
                                      style: textSimplegrey,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        //======================= footer   ====================//

        bottomNavigationBar: BottomAppBar(
          height: 100,
          color: const Color.fromARGB(255, 68, 147, 212),
          child: Column(
            children: [
             const Padding(
                padding:   EdgeInsets.all(2),
                child:   Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'total : 12.000.000 LAk',
                      style: textsimpleWhite,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    height: 40,
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: const Center(
                      child: Text(
                        'ປິ້ນບິນ',
                        style: textTitleGrey,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
