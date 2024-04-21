// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:tution_master/student_note_page/widget/student_bottomsheet.dart';
import 'package:tution_master/student_note_page/widget/student_note_list_container.dart';
import 'package:tution_master/utils/colors_constants.dart';

class Studentnotescreen extends StatefulWidget {
  const Studentnotescreen({super.key});

  @override
  State<Studentnotescreen> createState() => _StudentnotescreenState();
}

class _StudentnotescreenState extends State<Studentnotescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Studentbottomsheet(context);
        },
        label: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Studentnotelistcontainer(),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: 5),
          )
        ],
      ),
    );
  }
}
