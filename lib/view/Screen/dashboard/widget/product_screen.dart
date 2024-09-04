import 'package:dslsale/data/data_dump.dart';
import 'package:dslsale/util/textstyle.dart';
import 'package:dslsale/view/Screen/dashboard/detailproduct/product_detail.dart';
import 'package:dslsale/view/Screen/dashboard/widget/search_screen.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final gridMap = Data();
  @override
  Widget build(BuildContext context) {
//================ tap to detail ================//

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            backgroundColor: Colors.blueAccent,
            title: const Text(
              'ຊື້ສິນຄ້າ',
              style: textTitlewhite,
            ),
          ),
          body:

              //================ lIst view ===============//
              SingleChildScrollView(
            child: Column(
              children: [
                const SearchScreen(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailProductScreen()));
                  },
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      primary: false,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 10),
                          child: SizedBox(
                              height: 80,

                              //==================== card Listtile ================//

                              child: Card(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${gridMap.gridMap[index]['title']}',
                                          style: textSimplegrey,
                                        ),
                                        Text(
                                          '${gridMap.gridMap[index]['price']}',
                                          style: textSimplegrey,
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color.fromARGB(
                                              255, 185, 191, 200)),
                                      child: IconButton(
                                          onPressed: () {
                                            final snackBar = SnackBar(
                                              content: const Text(
                                                  "ເພີ່ມເຂົ້າກະຕ່າສຳເລັດ"),
                                              action: SnackBarAction(
                                                  label: "Undo",
                                                  onPressed: () {}),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          },
                                          icon: const Icon(
                                            Icons.add_shopping_cart_rounded,
                                            color: Colors.white,
                                          )),
                                    ),
                                  )
                                ],
                              ))),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
