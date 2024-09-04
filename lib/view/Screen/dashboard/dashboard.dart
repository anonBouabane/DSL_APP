import 'package:dslsale/util/textstyle.dart';
import 'package:dslsale/view/Screen/dashboard/widget/product_screen.dart';
import 'package:dslsale/view/Screen/infocusto/info_custo.dart';
import 'package:dslsale/view/Screen/printBill/history_invoice.dart';
import 'package:dslsale/view/Screen/productcart/product_cart.dart';
import 'package:dslsale/view/Screen/profile/profile.dart';
import 'package:dslsale/view/Screen/registerCustomer/register_customer.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // //=========drawer===========//

        // drawer: const DrawerScreen(),
        // backgroundColor: Colors.white,

        //==========Topbar =========//

        body: SingleChildScrollView(
          child: Stack(
            children: [
              const FirstTopbar(),
              Positioned(
                top: 35,
                right: 15,
                child: SizedBox(
                  height: 35,
                  width: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.logout_rounded,
                          color: Colors.lightBlue,
                          size: 20,
                        )),
                  ),
                ),
              ),
              Positioned(
                top: 35,
                left: 15,
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.white),bottom: BorderSide(color: Colors.white))),
                  child: const Text(
                    "DSL",
                    style: textTitlewhite,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 9),
                child: const Divider(indent: 10,endIndent: 10,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 6),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //>>>>>>>>>>>.second topbar >>>>>.>>>>

                    SecondTopbar()
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height / 2.8,
                    horizontal: 10),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "ຟັງຊັ່ນຫລັກ",
                            style: textSimpleBold,
                          ),
                        ],
                      ),
                    ),
                    CardProduct(),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      indent: 70,
                      endIndent: 70,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondTopbar extends StatefulWidget {
  const SecondTopbar({super.key});

  @override
  State<SecondTopbar> createState() => _SecondTopbarState();
}

class _SecondTopbarState extends State<SecondTopbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.white),
              right: BorderSide(color: Colors.white),
              left: BorderSide(color: Colors.white)),
          color: Colors.lightBlue,
          borderRadius: BorderRadius.all(Radius.circular(40))),
      width: MediaQuery.of(context).size.width / 1.2,
      height: 120,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Anon Bouaban",
              style: textTitlewhite,
            ),
          ],
        ),
      ),
    );
  }
}

class FirstTopbar extends StatefulWidget {
  const FirstTopbar({super.key});

  @override
  State<FirstTopbar> createState() => _FirstTopbarState();
}

class _FirstTopbarState extends State<FirstTopbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      ),
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
    );
  }
}

class CardProduct extends StatefulWidget {
  const CardProduct({super.key});

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: const Color.fromARGB(255, 211, 217, 220),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //===========>> purchase product <<============
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductScreen()));
                    },
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopify_rounded,
                            size: 35,
                            color: Colors.blue,
                          ),
                          Text(
                            'ຊື້ສິນຄ້າ',
                            style: textSimplegrey,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                //===============>>> register customer <<<<===============
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RegisterCustoScreen()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_add_alt_1_outlined,
                            size: 35,
                            color: Colors.blue,
                          ),
                          Text(
                            'ລົງທະບຽນລູກຄ້າ',
                            style: textSimplegrey,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                //===============>> customer info <<=============
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InfoCustomer()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.people_outline,
                            size: 35,
                            color: Colors.blue,
                          ),
                          Text(
                            'ຂໍ້ມູນລູກຄ້າ',
                            style: textSimplegrey,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  //=================>>> print invoice <<<<=============
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HistoryInvoice()));
                    },
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.print,
                            size: 35,
                            color: Colors.blue,
                          ),
                          Text(
                            'ລາຍການສັ່ງຊື້',
                            style: textSimplegrey,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                //===========>>> cart widget <<============
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartScreen()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 35,
                            color: Colors.blue,
                          ),
                          Text(
                            'ກະຕ່າສິນຄ້າ',
                            style: textSimplegrey,
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                //===============>>>Profile widget<<===========
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_pin_outlined,
                            size: 35,
                            color: Colors.blue,
                          ),
                          Text(
                            'ເບິ່ງໂປໄຟລ໌',
                            style: textSimplegrey,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
