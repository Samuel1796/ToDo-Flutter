// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:tuts/utils/my_buttons.dart';

class Dialogbox extends StatelessWidget {
  Dialogbox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[100],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //get user inputs
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a todo..."),
            ),
            //buttons save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save
                Mybutton(text: 'Save', onPressed: onSave),

                const SizedBox(
                  width: 8,
                ),

                //close
                Mybutton(text: "Close", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
