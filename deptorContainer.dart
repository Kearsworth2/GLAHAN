// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

class deptorContainer extends StatefulWidget {
  String nameOfDeptor;
  double amount;
  deptorContainer(this.nameOfDeptor, this.amount);
  State<deptorContainer> createState() => _deptorContainerState();
}

class _deptorContainerState extends State<deptorContainer> {
  bool isTextVisible = false;
  @override
  Widget build(BuildContext context) {
    String nameOfDeptor = widget.nameOfDeptor;
    double amount = widget.amount;
    return Container(
        //----------Container Decorated------------//
        padding: const EdgeInsets.all(20.0),
        width: 350,
        height: 150,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 253, 0, 223),
            border: Border.all(
              width: 0,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Name: ${nameOfDeptor}",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              "$amount บาท",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 5,
            right: 5.0,
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                // Toggle the visibility of the group of text
                setState(() {
                  isTextVisible = !isTextVisible;
                });
              },
              child: Icon(
                Icons.arrow_circle_down,
                size: 30,
              ),
            ),
          ),
          if (isTextVisible)
            Positioned(
              bottom: 5.0,
              right: 0.0,
              child: Container(
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 136, 128),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Text 1'),
                    Text('Text 2'),
                    Text('Text 3'),
                  ],
                ),
              ),
            ),
        ]));
  }
}
