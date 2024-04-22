// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:tution_master/utils/colors_constants.dart';

Future<dynamic> Studentbottomsheet(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Color.fromARGB(255, 190, 254, 250),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Title",
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 5))),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Description",
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 5))),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red)),
                            onPressed: () {},
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colorconstant.mainwhite),
                            )),
                        SizedBox(
                          width: 150,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.green)),
                            onPressed: () {},
                            child: Text("Save",
                                style:
                                    TextStyle(color: Colorconstant.mainwhite)))
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
