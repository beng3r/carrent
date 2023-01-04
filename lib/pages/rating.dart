import 'dart:ui';

import 'package:carrent/pages/homepage.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double _rating = 5;
  @override
  Widget build(BuildContext context) {
    double rating = 0;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 28, 124, 68),
        elevation: 0,
        title: Center(child: Text('C A R R E N T')),
        actions: [
          IconButton(
            onPressed: home,
            icon: Icon(Icons.person),
          )
        ],
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
            ),
            Text('Rating: $_rating', style: TextStyle(fontSize: 40)),
            RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                onRatingUpdate: (rating) => setState(() {
                      this._rating = rating;
                    })),
            SizedBox(
              height: 200,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: home,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 28, 124, 68),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    'DONE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void home() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
  }
}
