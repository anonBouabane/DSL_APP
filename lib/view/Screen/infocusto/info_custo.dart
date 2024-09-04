import 'package:dslsale/data/data_dump.dart';
import 'package:dslsale/util/textstyle.dart';
import 'package:dslsale/view/Screen/dashboard/widget/search_screen.dart';
import 'package:dslsale/view/Screen/infocusto/custo_detail.dart';
import 'package:flutter/material.dart';

class InfoCustomer extends StatefulWidget {
  const InfoCustomer({
    super.key,
  });

  @override
  State<InfoCustomer> createState() => _InfoCustomerState();
}

class _InfoCustomerState extends State<InfoCustomer> {
  final data = Data();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'ຂໍ້ມູນລູກຄ້າ',
            style: textTitlewhite,
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SearchScreen(),
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: data.infocusto.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 10),
                      child: SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailCustomer(
                                          index: index,
                                          fullName:
                                              '${data.infocusto[index]['fullName']}',
                                          gender: '${data.infocusto[index]['gender']}',
                                          age: '${data.infocusto[index]['age']}',
                                          address: '${data.infocusto[index]['address']}', phone: '${data.infocusto[index]['phone']}',
                                        )));
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading:
                                    Image.asset(data.infocusto[index]['image']),
                                title: Text(
                                  data.infocusto[index]['fullName'],
                                  style: textTitleGrey,
                                ),
                                subtitle: Text(
                                  data.infocusto[index]['phone'],
                                  style: textSimplegrey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ));
  }
}
