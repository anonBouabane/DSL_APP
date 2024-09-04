import 'package:dslsale/data/data_dump.dart';
import 'package:dslsale/util/textstyle.dart';
import 'package:dslsale/view/Screen/dashboard/widget/search_screen.dart';
import 'package:dslsale/view/Screen/printBill/invoice.dart';
import 'package:flutter/material.dart';

class HistoryInvoice extends StatefulWidget {
  const HistoryInvoice({super.key});

  @override
  State<HistoryInvoice> createState() => _HistoryInvoiceState();
}

class _HistoryInvoiceState extends State<HistoryInvoice> {
  final mapData = Data();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        //=============== appbar ================//
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            "ລາຍການສັ່ງຊື້",
            style: textTitlewhite,
          ),
        ),
        //=============== content ================//

        body: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>   PdfPrintScreen()));
              },

              //=============== list view ================//

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 70, horizontal: 20),
                      child: ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 180,

                              //=============== card && Listile ================//

                              child: Card(
                                  child: ListTile(
                                title: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        "ເລກບິນ:${mapData.history[index]['id'].toString()}",
                                        style: textTitle,
                                      ),
                                    ),
                                    Row(
                                      //=============== status icon ================//

                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'ສະຖານະບິນ : ${mapData.history[index]['status']}',
                                          style: textTitleGrey,
                                        ),
                                        mapData.history[index]['status'] ==
                                                "ຍັງບໍ່ຊຳລະຄ້າງຈ່າຍ"
                                            ? const Icon(
                                                Icons.cancel,
                                                color: Colors.red,
                                              )
                                            : const Icon(
                                                Icons.check_circle,
                                                color: Colors.green,
                                              )
                                      ],
                                    ),
                                    Column(
                                      //=============== detail ================//

                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'ຊື່ຮ້ານ : ${mapData.history[index]['custoName']}',
                                              style: textSimplegrey,
                                            ),
                                            const Spacer(),
                                            Text(
                                              "ວັນທີສົ່ງ : ${mapData.history[index]['date']}",
                                              style: textSimplegrey,
                                            )
                                          ],
                                        ),
                                        Text(
                                          'ເບີໂທລູກຄ້າ : ${mapData.history[index]['phone']}',
                                          style: textSimplegrey,
                                        ),
                                        Text(
                                          'ສະຖານທີ່ສົ່ງ : ${mapData.history[index]['address']}',
                                          style: textSimplegrey,
                                        ),
                                        Text(
                                          'ເມືອງ : ${mapData.history[index]["distric"]}',
                                          style: textSimplegrey,
                                        ),
                                        Text(
                                          'ແຂວງ : ${mapData.history[index]['province']}',
                                          style: textSimplegrey,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),

            //================== search ==================
            Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: const SearchScreen())
          ],
        ),
      ),
    );
  }
}
