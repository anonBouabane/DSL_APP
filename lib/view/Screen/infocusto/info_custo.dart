import 'package:dslsale/data/controller/getcusto_controller.dart';
import 'package:dslsale/util/textstyle.dart';
import 'package:dslsale/view/Screen/dashboard/widget/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InfoCustomer extends StatefulWidget {
  const InfoCustomer({super.key});

  @override
  State<InfoCustomer> createState() => _InfoCustomerState();
}

class _InfoCustomerState extends State<InfoCustomer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GetCustomerController>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            title: const Text(
              'ຂໍ້ມູນລູກຄ້າ',
              style: textTitle,
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: value.isloading
              ? const Center(child: CircularProgressIndicator())
              : value.customer.isEmpty
                  ? const Center(
                      child: Text("No itam"),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const SearchScreen(),
                          ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: value.customer.length,
                            itemBuilder: (context, index) {
                              final customer = value.customer[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 10,
                                ),
                                child: SizedBox(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Handle customer detail navigation here
                                    },
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          title: Text(
                                            customer['shop_name'],
                                            style: textTitleGrey,
                                          ),
                                          // subtitle: Text(
                                          //   'Address: ${customer.provinceName ?? 'No Address'}\nPhone: ${customer.customerPhone ?? 'No Phone'}',
                                          //   style: textSimplegrey,
                                          // ),
                                        ),
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
        );
      },
    );
  }
}
