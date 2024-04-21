import 'package:flutter/material.dart';

class Studentnotelistcontainer extends StatelessWidget {
  const Studentnotelistcontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: const Color.fromARGB(255, 156, 166, 174)),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "title",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(Icons.delete),
                  ],
                ),
              ],
            ),
            Text(
              "descriptiom",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
