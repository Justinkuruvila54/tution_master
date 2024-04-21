// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tution_master/utils/colors_constants.dart';

class Studentsearchscreen extends StatefulWidget {
  @override
  _StudentsearchscreenState createState() => _StudentsearchscreenState();
}

class _StudentsearchscreenState extends State<Studentsearchscreen> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("Teacher");
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  late Stream<QuerySnapshot> _searchStream;

  @override
  void initState() {
    super.initState();
    _searchStream =
        FirebaseFirestore.instance.collection('Teacher').snapshots();
  }

  void _runSearch(String query) {
    setState(() {
      _searchQuery = query;
      _searchStream = FirebaseFirestore.instance
          .collection('Teacher')
          .where('Subject', isEqualTo: query)
          .snapshots();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstant.mainblack,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colorconstant.mainwhite,
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: _searchController,
                onChanged: (value) => _runSearch(value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search by subject',
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: StreamBuilder(
                stream: _searchStream,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No results found.'));
                  }
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
                                color: Color.fromARGB(255, 237, 255, 255)),
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
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "subject: ${userssnap["Subject"]}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Qualification:${userssnap["Qualification"]}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
