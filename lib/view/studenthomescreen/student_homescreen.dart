// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tution_master/utils/colors_constants.dart';

class Studenthomescreen extends StatefulWidget {
  const Studenthomescreen({super.key});

  @override
  State<Studenthomescreen> createState() => _StudenthomescreenState();
}

class _StudenthomescreenState extends State<Studenthomescreen> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("Teacher");
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colorconstant.mainblack,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: StreamBuilder(
                    stream: collectionReference.snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Loading");
                      } else {
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              final QueryDocumentSnapshot<Object?> userssnap =
                                  snapshot.data!.docs[index];

                              return Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colorconstant.mainwhite,
                                            blurRadius: 50)
                                      ],
                                      borderRadius: BorderRadius.circular(25),
                                      color:
                                          Color.fromARGB(255, 237, 255, 255)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 40,
                                              backgroundImage: AssetImage(
                                                  "assets/images/2151419531.jpg"),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  " ${userssnap["Name"]}",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "subject: ${userssnap["Subject"]}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Qualification:${userssnap["Qualification"]}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () {
                                            try {
                                              FirebaseFirestore.instance
                                                  .collection(
                                                      'selectedteacherlist')
                                                  .add({
                                                "Name": userssnap["Name"],
                                                "Subject": userssnap["Subject"],
                                                "Qualification":
                                                    userssnap["Qualification"]
                                              }).then((value) {
                                                print(
                                                    "Teacher added to selected list");
                                              }).catchError((error) {
                                                print(
                                                    "Failed to add teacher: $error");
                                              });
                                            } catch (e) {
                                              print("Error: $e");
                                            }
                                          },
                                          child: Container(
                                              height: 35,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.red),
                                              child:
                                                  Center(child: Text("add"))),
                                        )
                                      ],
                                    ),
                                  ));
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 10,
                                ),
                            itemCount: snapshot.data!.docs.length);
                      }
                    },
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
