import 'package:dslsale/util/textstyle.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  dynamic keyboardType;
  String text;
  double width;

  TextFieldWidget({
    super.key,
    required this.text,
    required this.keyboardType,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
                width: width,
            height: 50,
            child: TextFormField(
                decoration: InputDecoration(
              focusColor: Colors.blue,
              label: Text(text, style: textSimplegrey),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              border: const OutlineInputBorder(),
              iconColor: Colors.blue,
            )),
          ),
        ),
      ],
    );
  }
}
