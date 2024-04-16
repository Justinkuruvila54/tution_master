// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class Studentsearchscreen extends StatefulWidget {
  const Studentsearchscreen({super.key});

  @override
  State<Studentsearchscreen> createState() => _StudentsearchscreenState();
}

class _StudentsearchscreenState extends State<Studentsearchscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 202, 227, 239),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.amber,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Name"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("Subject"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("qulification")
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    height: 40,
                                    width: 80,
                                    child: Center(child: Text("Add")),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 1, 164, 7),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 5,
                        ),
                    itemCount: 5)
              ],
            ),
          ),
        ));
  }
}
