// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:carrent/Cars/car.dart';
import 'package:carrent/read%20data/get_username.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Cars/car.dart';
import '../Cars/cardetails.dart';
import 'bookpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

//IDs
  List<String> docIDs = [];

//get IDs

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 28, 124, 68),
          elevation: 0,
          title: Center(child: Text('C A R R E N T')),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            )
          ],
        ),
        drawer: Drawer(),
        body: SafeArea(
          child: ListView.builder(
            itemCount: Cars.samples.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CarDetails(car: Cars.samples[index]);
                      },
                    ),
                  );
                },
                child: buildCarsCard(Cars.samples[index]),
              );
            },
          ),
        ));
  }
}

Widget buildCarsCard(Cars cars) {
  return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: <Widget>[
          Image(image: AssetImage(cars.logoImagePath)),
          SizedBox(
            height: 20,
          ),
          Text(
            cars.name.toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('\RM ' + cars.dailyRate.toString() + '/day')
        ]),
      ));
}
