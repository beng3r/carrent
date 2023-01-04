import 'package:carrent/Cars/car.dart';
import 'package:carrent/pages/homepage.dart';
import 'package:carrent/pages/rating.dart';
import 'package:flutter/material.dart';
import 'car.dart';

class CarDetails extends StatefulWidget {
  final Cars car;

  const CarDetails({Key? key, required this.car}) : super(key: key);

  @override
  _CarDetailsState createState() {
    return _CarDetailsState();
  }
}

class _CarDetailsState extends State<CarDetails> {
  int _sliderVal = 1;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(children: <Widget>[
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image(image: AssetImage(widget.car.logoImagePath)),
            ),
            Center(
                child: Container(
              child: Text(
                widget.car.name.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            )),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.car.specs.length,
                itemBuilder: (BuildContext context, int index) {
                  final specs = widget.car.specs[index];
                  return Text(
                      '${'TOTAL = RM '} '
                      '${widget.car.dailyRate * _sliderVal} '
                      '${'for'} '
                      '${_sliderVal}'
                      '${'day(s)'}'
                      '\n'
                      'Car Details : '
                      '\n'
                      '${specs.brand}'
                      '\n'
                      '${specs.seats}'
                      ' seaters',
                      style: const TextStyle(fontSize: 28));
                },
              ),
            ),
<<<<<<< HEAD
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: GestureDetector(
                onTap: signUp,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 28, 124, 68),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    'Buy',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )),
                ),
              ),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              label: '${_sliderVal * widget.car.dailyRate} rate',
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
=======
            SizedBox(
              height: 10,
>>>>>>> b8b10933d15c70775c50660208407c9015e514d8
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          //controller: _emailcontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Discount Code',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Slider(
                    min: 1,
                    max: 30,
                    divisions: 10,
                    label: '${_sliderVal} day(s)',
                    value: _sliderVal.toDouble(),
                    onChanged: (newValue) {
                      setState(() {
                        _sliderVal = newValue.round();
                      });
                    },
                    activeColor: Colors.green,
                    inactiveColor: Colors.black,
                  ),
                ],
              ),
            ),
          ]),
        ));
  }

  void signUp() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Rating()));
  }
}
