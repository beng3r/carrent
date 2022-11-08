// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Cars extends StatelessWidget {
  final String name;
  final String logoImagePath;
  final int dailyRate;
  List<Spec> specs;
  Cars({
    required this.name,
    required this.logoImagePath,
    required this.dailyRate,
    required this.specs,
  });

  static List<Cars> samples = [
    Cars(
        name: 'Axia',
        logoImagePath: 'assets/images/axia.png',
        dailyRate: 80,
        specs: [Spec('Perodua', 'transmission', 'engine', 4)]),
    Cars(
        name: 'X70',
        logoImagePath: 'assets/images/x70.png',
        dailyRate: 150,
        specs: [Spec('brand', 'transmission', 'engine', 5)]),
    Cars(
        name: 'Vellfire',
        logoImagePath: 'assets/images/vellfire.png',
        dailyRate: 250,
        specs: [Spec('brand', 'transmission', 'engine', 7)]),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 200,
          padding: EdgeInsets.all(12),
          color: Colors.grey[200],
          child: Column(children: [
            Row(
              children: [
                Center(
                  child: Container(
                    height: 100,
                    width: 170,
                    child: Image.asset(logoImagePath),
                  ),
                ),
              ],
            ),
            Center(
                child: Text(
              name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 10,
            ),
            Text(
              '\RM ' + dailyRate.toString() + '/day',
            )
          ]),
        ),
      ),
    );
  }
}

class Spec {
  String brand;
  String transmission;
  String engine;
  int seats;
  Spec(this.brand, this.transmission, this.engine, this.seats);
}
