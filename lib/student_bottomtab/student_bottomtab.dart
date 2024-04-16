// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tution_master/student_addedlist_page/student_addedlist-screen.dart';
import 'package:tution_master/student_search_page/student_search_screen.dart';
import 'package:tution_master/studenthomescreen/student_homescreen.dart';

class Studentbottomtab extends StatefulWidget {
  const Studentbottomtab({super.key});

  @override
  State<Studentbottomtab> createState() => _StudentbottomtabState();
}

class _StudentbottomtabState extends State<Studentbottomtab> {
  List<Widget> bottomscreen = [
    Studenthomescreen(),
    Studentsearchscreen(),
    Studentaddedlistscreen()
  ];

  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0095FF),
          ),
          bottomNavigationBar: BottomNavigationBar(
              iconSize: 28,
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
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.playlist_add_rounded),
                    label: "added list"),
              ]),
          body: bottomscreen[selectedindex]),
    );
  }
}
