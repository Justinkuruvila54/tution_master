// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Teachersignupscreen extends StatefulWidget {
  @override
  State<Teachersignupscreen> createState() => _TeachersignupscreenState();
}

class _TeachersignupscreenState extends State<Teachersignupscreen> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Teacher");
  final _formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController subjectcontroller = TextEditingController();
  TextEditingController qualificationcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 4,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: <Widget>[
                    Text(
                      "Signup",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Signup to your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              controller: namecontroller,
                              decoration: InputDecoration(
                                  label: Text("Name"),
                                  prefixIcon: Icon(Icons.person),
                                  hintText: "Name",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 5))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              controller: emailcontroller,
                              decoration: InputDecoration(
                                  label: Text("Email"),
                                  prefixIcon: Icon(Icons.email),
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 5))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              controller: subjectcontroller,
                              decoration: InputDecoration(
                                  label: Text("Subject"),
                                  prefixIcon: Icon(Icons.menu_book_rounded),
                                  hintText: "Subject",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 5))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              controller: qualificationcontroller,
                              decoration: InputDecoration(
                                  label: Text("Qualification"),
                                  prefixIcon: Icon(Icons.school),
                                  hintText: "Qualification",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 5))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock_outline),
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 10, color: Colors.black))),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );

                          collectionReference.add({
                            "Name": namecontroller.text,
                            "Subject": subjectcontroller.text,
                            "Qualification": qualificationcontroller.text
                          });
                        }
                      },
                      color: Color(0xff0095FF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" have an account?"),
                    Text(
                      " Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
