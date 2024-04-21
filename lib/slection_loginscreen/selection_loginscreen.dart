// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_returning_null_for_void, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tution_master/student_loginscreen/student_loginscreen.dart';

import 'package:tution_master/teacher_loginpage/teacher_loginscreen.dart';

class Selectionuserscreen extends StatefulWidget {
  const Selectionuserscreen({super.key});

  @override
  State<Selectionuserscreen> createState() => _SelectionuserscreenState();
}

class _SelectionuserscreenState extends State<Selectionuserscreen> {
  int selectedindex = 0;

  List<Map> userselection = [
    {"name": "Teacher", "userprofile": "assets/images/teacher_profile.png"},
    {"name": "Student", "userprofile": "assets/images/student_profile.png"}
  ];

  List selectionscreen = [Teacherloginscreen(), Studentloginscreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff0095FF),
        title: Center(
          child: Text(
            "Tution Master",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 253, 253),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back !",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      shadows: List.filled(
                          100,
                          Shadow(
                              color: Colors.blue,
                              offset: Offset.fromDirection(
                                BorderSide.strokeAlignOutside,
                              )))),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/welcome.png")))),
                ),
                SizedBox(
                  height: 70,
                ),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 2,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          selectedindex = index;
                          setState(() {});
                        },
                        child: Container(
                          height: index == selectedindex ? 80 : 60,
                          width: index == selectedindex ? 80 : 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: CircleAvatar(
                            backgroundColor: index == selectedindex
                                ? Colors.blue
                                : Colors.grey[400],
                            backgroundImage:
                                AssetImage(userselection[index]["userprofile"]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        userselection[index]["name"],
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.black)),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        if (selectedindex == selectedindex) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      selectionscreen[selectedindex]));
                        } else {
                          return null;
                        }
                      },
                      color: Color(0xff0095FF),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
