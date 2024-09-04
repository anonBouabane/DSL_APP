// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dslsale/util/images.dart';
// import 'package:flutter/material.dart';

// class CarouselScreen extends StatefulWidget {
//   const CarouselScreen({super.key});

//   @override
//   State<CarouselScreen> createState() => _CarouselScreenState();
// }

// class _CarouselScreenState extends State<CarouselScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//                   options: CarouselOptions(
//                       enlargeFactor: 1,
//                       autoPlayInterval: const Duration(milliseconds: 2000),
//                       autoPlay: true,
//                       viewportFraction: 1,
//                       height: 200.0),
//                   items: Modelcarousel().modelcarousel.map((i) {
//                     return Builder(
//                       builder: (BuildContext context) {
//                         return Container(
//                             width: MediaQuery.of(context).size.width,
//                             margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                             decoration:
//                                 const BoxDecoration(color: Colors.amber),
//                             child: Image.asset(
//                               i.toString(),
//                               fit: BoxFit.fill,
//                             ));
//                       },
//                     );
//                   }).toList(),
//                 );
//   }
// }