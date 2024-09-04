import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  final List<Map<String, dynamic>> gridMap = [
    {
      "id": 1,
      "title": "ໂອອິຊິ",
      "image": "assets/images/Oishi.jpeg",
      "price": "100.000"
    },
    {
      "id": 2,
      "title": "ແປັບຊີ",
      "image": "assets/images/pepsi.jpeg",
      "price": "500.000"
    },
    {
      "id": 3,
      "title": "ນົມ",
      "image": "assets/images/milk.jpeg",
      "price": "200.000"
    },
    {
      "id": 4,
      "title": "ສະຕິງ",
      "image": "assets/images/stings.jpeg",
      "price": "1.500.000"
    },
    {
      "id": 5,
      "title": "ນ້ຳ",
      "image": "assets/images/waters.jpeg",
      "price": "130.000"
    },
    {
      "id": 6,
      "title": "ເບຍ",
      "image": "assets/images/beer.jpeg",
      "price": "220.000"
    },
    {
      "id": 7,
      "title": "budweiser",
      "image": "assets/images/budweiser.jpeg",
      "price": "400.000"
    },
    {
      "id": 8,
      "title": "heiniken",
      "image": "assets/images/heiniken.jpeg",
      "price": "430.000"
    },
    {
      "id": 9,
      "title": "ສະຕິງ",
      "image": "assets/images/stings.jpeg",
      "price": "1.500.000"
    },
    {
      "id": 10,
      "title": "ສະຕິງ",
      "image": "assets/images/stings.jpeg",
      "price": "1.500.000"
    },
    {
      "id": 11,
      "title": "ສະຕິງ",
      "image": "assets/images/stings.jpeg",
      "price": "1.500.000"
    },
    {
      "id": 12,
      "title": "ສະຕິງ",
      "image": "assets/images/stings.jpeg",
      "price": "1.500.000"
    },
  ];
  final List<dynamic> history = [
    {
      "id": 111320240596,
      "status": "ຊຳລະແລ້ວ",
      "custoName": "ໂບ່ກີ້  ",
      "phone": "77995490",
      "address": "ບ້ານໂພນສະຫວາດ",
      "distric": "ສີໂຄດ",
      "province": "ນະຄອນຫລວງ",
      "date": "01/06/24"
    },
    {
      "id": 111320240597,
      "status": "ຍັງບໍ່ຊຳລະຄ້າງຈ່າຍ",
      "custoName": "ມາຣິນ່າ  ",
      "phone": "97184703",
      "address": "ບ້ານໂພນສະຫວາດ",
      "distric": "ສີໂຄດ",
      "province": "ນະຄອນຫລວງ",
      "date": "01/06/24"
    },
    {
      "id": 111320240598,
      "status": "ຍັງບໍ່ຊຳລະຄ້າງຈ່າຍ",
      "custoName": "ເລດີ້  ",
      "phone": "55929277",
      "address": "ບ້ານໂພນສະຫວາດ",
      "distric": "ສີໂຄດ",
      "province": "ນະຄອນຫລວງ",
      "date": "01/06/24"
    },
    {
      "id": 111320240601,
      "status": "ຊຳລະແລ້ວ",
      "custoName": "ບິວກິ້ນ  ",
      "phone": "77995490",
      "address": "ບ້ານໂພນສະຫວາດ",
      "distric": "ສີໂຄດ",
      "province": "ນະຄອນຫລວງ",
      "date": "01/06/24"
    },
    {
      "id": 111320240601,
      "status": "ຊຳລະແລ້ວ",
      "custoName": "ສຸລະໄຊ  ",
      "phone": "77995490",
      "address": "ບ້ານໂພນສະຫວາດ",
      "distric": "ສີໂຄດ",
      "province": "ນະຄອນຫລວງ",
      "date": "01/06/24"
    },
    {
      "id": 111320240602,
      "status": "ຊຳລະແລ້ວ",
      "custoName": "ເອກກກະພົບ  ",
      "phone": "77995490",
      "address": "ບ້ານໂພນສະຫວາດ",
      "distric": "ສີໂຄດ",
      "province": "ນະຄອນຫລວງ",
      "date": "01/06/24"
    },
    {
      "id": 111320240603,
      "status": "ຊຳລະແລ້ວ",
      "custoName": "ອັກຄະລະເດດ  ",
      "phone": "77995490",
      "address": "ບ້ານໂພນສະຫວາດ",
      "distric": "ສີໂຄດ",
      "province": "ນະຄອນຫລວງ",
      "date": "01/06/24"
    },
    {
      "id": 111320240604,
      "status": "ຊຳລະແລ້ວ",
      "custoName": "ດຸກດິກ  ",
      "phone": "77995490",
      "address": "ບ້ານໂພນສະຫວາດ",
      "distric": "ສີໂຄດ",
      "province": "ນະຄອນຫລວງ",
      "date": "01/06/24"
    },
    {
      "id": 111320240605,
      "status": "ຊຳລະແລ້ວ",
      "custoName": "ພອນປະພາ  ",
      "phone": "77995490",
      "address": "ບ້ານໂພນສະຫວາດ",
      "distric": "ສີໂຄດ",
      "province": "ນະຄອນຫລວງ",
      "date": "01/06/24"
    },
    {
      "id": 111320240606,
      "status": "ຊຳລະແລ້ວ",
      "custoName": "ອ້າຍ  ",
      "phone": "77995490",
      "address": "ບ້ານໂພນສະຫວາດ",
      "distric": "ສີໂຄດ",
      "province": "ນະຄອນຫລວງ",
      "date": "01/06/24"
    }
  ];
  List<Map<String, dynamic>> infocusto = [
    {
      "id": "1",
      "fullName": "aiy",
      "phone": "123456",
      "gender": "ຊາຍ",
      "age": "21",
      "address": "sikhod",
      "image": "assets/images/profile.png"
    },
    {
      "id": "2",
      "fullName": "anon",
      "phone": "123456",
      "gender": "ຊາຍ",
      "age": "22",
      "address": "phonesavath",
      "image": "assets/images/profile.png"
    },
    {
      "id": "3",
      "fullName": "lambo123",
      "phone": "123456",
      "gender": "ຍິງ",
      "age": "55",
      "address": "nonkhylek",
      "image": "assets/images/profile.png"
    },
    {
      "id": "4",
      "fullName": "alex",
      "phone": "123456",
      "gender": "ຍິງ",
      "age": "34",
      "address": "sysavath",
      "image": "assets/images/profile.png"
    },
    {
      "id": "5",
      "fullName": "Alien",
      "phone": "123456",
      "gender": "ຍິງ",
      "age": "14",
      "address": "phabard",
      "image": "assets/images/profile.png"
    },
    {
      "id": "6",
      "fullName": "alisa",
      "phone": "123456",
      "gender": "ຊາຍ",
      "age": "22",
      "address": "donkey",
      "image": "assets/images/profile.png"
    },
    {
      "id": "7",
      "fullName": "jay jay",
      "phone": "123",
      "gender": "ຊາຍ",
      "age": "27",
      "address": "dongmarkkhary",
      "image": "assets/images/profile.png"
    },
    {
      "id": "8",
      "fullName": "milk",
      "phone": "1220023",
      "gender": "ຍີງ",
      "age": "35",
      "address": "vudtai",
      "image": "assets/images/profile.png"
    },
    {
      "id": "9",
      "fullName": "kvin",
      "phone": "778899",
      "gender": "ຊາຍ",
      "age": "43",
      "address": "nongtaeng",
      "image": "assets/images/profile.png"
    }
  ];
}
