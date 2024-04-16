import 'package:flutter/material.dart';

class Studenthomescreen extends StatefulWidget {
  const Studenthomescreen({super.key});

  @override
  State<Studenthomescreen> createState() => _StudenthomescreenState();
}

class _StudenthomescreenState extends State<Studenthomescreen> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          backgroundColor: Color(0xff0095FF),
          onTap: (index) {
            selectedindex = index;
            setState(() {});
          },
          currentIndex: selectedindex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.playlist_add_rounded), label: "added list"),
          ]),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Text("ghj"),
      ),
    ));
  }
}
