import 'package:dslsale/util/textstyle.dart';
import 'package:flutter/material.dart';

class ProductTypeScreen extends StatefulWidget {
  const ProductTypeScreen({super.key});

  @override
  State<ProductTypeScreen> createState() => _ProductTypeScreenState();
}

class _ProductTypeScreenState extends State<ProductTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        //========== List view =========//

        height: 50,
        child: ListView.builder(
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 3),

        //========== tap Index =========//

                child: GestureDetector(
                  onTap: () {
                    tapIndex(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(),
                        color: index == currentindex
                            ? const Color.fromARGB(255, 68, 147, 212)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    width: 100,
                    height: 30,
                    child: Center(
                      child: Text(
                        data[index].toString(),
                        style: textSimple,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  int currentindex = 0;
  tapIndex(index) {
    setState(() {
      currentindex = index;
    });
  }

  List<String> data = ["ຂະຫນົມ", "ນ້ຳ", "ເຄື່ອງສຳອາງ", "ເຄື່ອງໃຊ້ເຮືອນ"];
}
