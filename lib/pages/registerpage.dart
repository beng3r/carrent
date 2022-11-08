// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();

  final _usernamecontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _phonenumbercontroller = TextEditingController();
  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    _usernamecontroller.dispose();
    _addresscontroller.dispose();
    _phonenumbercontroller.dispose();

    super.dispose();
  }

  Future signUp() async {
    // create user
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailcontroller.text.trim(),
          password: _passwordcontroller.text.trim());

      //user details
      addUserDetails(
        _usernamecontroller.text.trim(),
        _addresscontroller.text.trim(),
        int.parse(_phonenumbercontroller.text.trim()),
        _emailcontroller.text.trim(),
      );
    }
  }

  Future addUserDetails(
      String name, String address, int phoneNo, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Name': name,
      'Address': address,
      'Phone No': phoneNo,
      'Email': email,
    });
  }

  bool passwordConfirmed() {
    if (_passwordcontroller.text.trim() ==
        _confirmpasswordcontroller.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.car_rental,
                size: 100,
              ),
              Text(
                "CARRENT",
                style: GoogleFonts.quantico(fontSize: 18),
              ),
              SizedBox(
                height: 40,
              ),
              //welcome
              Text('Register Now!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                  )),
              SizedBox(
                height: 1,
              ),
              Text(
                'Enter your details below',
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 44, 44, 44)),
              ),

              //name
              SizedBox(
                height: 20,
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
                      controller: _usernamecontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name',
                      ),
                    ),
                  ),
                ),
              ),

              //address
              SizedBox(
                height: 10,
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
                      controller: _addresscontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Address',
                      ),
                    ),
                  ),
                ),
              ),

              //phone number
              SizedBox(
                height: 10,
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
                      controller: _phonenumbercontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone No',
                      ),
                    ),
                  ),
                ),
              ),

              //email
              SizedBox(
                height: 10,
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
                      controller: _emailcontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //password
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
                      controller: _passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              //password again
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
                      controller: _confirmpasswordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Confirm Password',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //sign in
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
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                  ),
                ),
              ),

              SizedBox(
                height: 25,
              ),

              //register

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(
                      ' Login Now',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
