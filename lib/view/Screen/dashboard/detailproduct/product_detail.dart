import 'package:dslsale/util/textstyle.dart';
import 'package:dslsale/view/Screen/productcart/product_cart.dart';
import 'package:dslsale/view/Screen/payment/payment_detail.dart';
import 'package:flutter/material.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//================ appbar ==============//

      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size: 25,
              ))
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Detail",
          style: textTitle,
        ),
        centerTitle: true,
      ),

//================content==============//

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //================== content detail   ===============//

            const Text(
              'ນ້ຳດື່ມຫົວເສືອ 1500ml ແພັກ 6 ຕຸກ , ນ້ຳດື່ມຫົວເສືອ 250ml ແພັກ 24 ຕຸກ , ນ້ຳດື່ມຫົວເສືອ 600ml ແພັກ 12 ຕຸກນ້ຳດື່ມຫົວເສືອ 1500ml ແພັກ 6 ຕຸກ , ນ້ຳດື່ມຫົວເສືອ 250ml ແພັກ 24 ຕຸກ , ນ້ຳດື່ມຫົວເສືອ 600ml ແພັກ 12 ຕຸກນ້ຳດື່ມຫົວເສືອ 1500ml ແພັກ 6 ຕຸກ , ນ້ຳດື່ມຫົວເສືອ 250ml ແພັກ 24 ຕຸກ , ນ້ຳດື່ມຫົວເສືອ 600ml ແພັກ 12 ຕຸກນ້ຳດື່ມຫົວເສືອ 1500ml ແພັກ 6 ຕຸກ , ນ້ຳດື່ມຫົວເສືອ 250ml ແພັກ 24 ຕຸກ , ນ້ຳດື່ມຫົວເສືອ 600ml ແພັກ 12 ຕຸກ',
              style: textSimplegrey,
            ),
            Row(
              //================== amount  ===============//

              children: [
                const Text(
                  "ຈຳນວນ : ",
                  style: textSimpleBold,
                ),
                IconButton(
                  onPressed: () {
                    remove();
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                ),
                Text(
                  counter.toString(),
                  style: textSimpleBold,
                ),
                IconButton(
                    onPressed: () {
                      add();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.black,
                    )),
              ],
            ),
          ],
        ),
      ),

      //========= footer ===========//

      bottomNavigationBar: BottomAppBar(
        color:   Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //================== icon payment  ===============//

            Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PaymentDetailScreen()));
                    },
                    child: const Text(
                      'ຊຳລະ',
                      style: textTitlewhite,
                    ))),
            Container(
              width: MediaQuery.of(context).size.width / 5,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.amberAccent, borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text("ເພີ່ມເຂົ້າກະຕ່າສຳເລັດ"),
                      action: SnackBarAction(label: "Undo", onPressed: () {}),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },

                  //================== icon cart  ===============//

                  icon: const Icon(
                    Icons.add_shopping_cart_outlined,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  int counter = 1;
  add() {
    setState(() {
      counter += 1;
    });
  }

  remove() {
    if (counter == 1) {
      return;
    }
    setState(() {
      counter -= 1;
    });
  }
}
