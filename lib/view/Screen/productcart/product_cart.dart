import 'package:dslsale/data/data_dump.dart';
import 'package:dslsale/util/textstyle.dart';
import 'package:dslsale/view/Screen/payment/payment_detail.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final gridmap = Data();

    return Scaffold(
      //================ appbar ==============//

      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        title: const Text(
          'ກະຕ່າສິນຄ້າ',
          style: textTitle,
        ),
        centerTitle: true,
      ),

      //================ content ==============//

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  primary: false,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 80,

                      // ================ card Listile  ==================//
                      child: Card(
                        child: Center(
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'ສິນຄ້າ : ',
                                      style: textSimplegrey,
                                    ),
                                    const Spacer(),
                                    Text(
                                      gridmap.gridMap[index]['title'],
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
                                      gridmap.gridMap[index]['price'],
                                      style: textSimplegrey,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),

      //===========>> footer ================

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [const Text('Total : 120.200.000',style: textSimpleBold,),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width/2,
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10))),

                //====================== tap to payment========================
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PaymentDetailScreen()));
                    },
                    child: const Text(
                      "ຊຳລະ",
                      style: textTitlewhite,
                    ))),
          ],
        ),
      ),
    );
  }
}
