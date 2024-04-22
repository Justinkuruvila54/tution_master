// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tution_master/utils/colors_constants.dart';

class Studentaddedlistscreen extends StatefulWidget {
  const Studentaddedlistscreen({super.key});

  @override
  State<Studentaddedlistscreen> createState() => _StudentaddedlistscreenState();
}

class _StudentaddedlistscreenState extends State<Studentaddedlistscreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("selectedteacherlist");
    return SafeArea(
      child: Scaffold(
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
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
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
                                          Container(
                                              height: 35,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.red),
                                              child: Center(child: Text("add")))
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
      ),
    );
  }
}
