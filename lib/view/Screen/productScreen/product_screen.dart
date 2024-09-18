import 'dart:io';

import 'package:dslsale/data/controller/getproduct_controller.dart';
import 'package:dslsale/util/textstyle.dart';
import 'package:dslsale/view/Screen/dashboard/detailproduct/product_detail.dart';
import 'package:dslsale/view/Screen/dashboard/widget/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String truncateTExt(String text, {int maxlength = 30}) {
    return (text.length > maxlength)
        ? '${text.substring(0, maxlength)}...'
        : text;
  }

  @override
  Widget build(BuildContext context) {
//================ tap to detail ================//

    return GestureDetector(onTap: () {
      FocusScope.of(context).unfocus();
    }, child: Consumer<GetProductController>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          title: const Text(
            'ຊື້ສິນຄ້າ',
            style: textTitle,
          ),
        ),
        body: value.isloading == true
            ? Center(
                child: Platform.isAndroid
                    ? const CircularProgressIndicator()
                    : const CupertinoActivityIndicator())
            : value.product.isEmpty
                ? const Center(child: Text('No item'))
                :

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
                                      builder: (context) =>
                                          const DetailProductScreen()));
                            },
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: value.product.length,
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    truncateTExt(
                                                        value.product[index]
                                                            ['item_name']),
                                                    style: textSimplegrey,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                  Text(
                                                    '${value.product[index]['pack_type_name']}',
                                                    style: textSimplegrey,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
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
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    },
                                                    icon: const Icon(
                                                      Icons
                                                          .add_shopping_cart_rounded,
                                                      color: Colors.white,
                                                    )),
                                              ),
                                            )
                                          ],
                                        ))),
                                  );
                                })),
                      ],
                    ),
                  ),
      );
    }));
  }
}
