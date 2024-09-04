import 'package:flutter/material.dart';

loading(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return const AlertDialog(
        content: SizedBox(
          height: 100,
          child: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 10),
              Text("ກຳລັງໂຫຼດ...")
            ],
          ),
        ),
      );
    },
  );
}

success(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          // title: Text("ສຳເລັດ"),
          content: const SizedBox(
            height: 80,
            child: Column(
              children: [
                Icon(
                  Icons.check,
                  size: 40,
                  color: Colors.green,
                ),
                Text(
                  "ສຳເລັດແລ້ວ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"))
          ],
        );
      });
}
