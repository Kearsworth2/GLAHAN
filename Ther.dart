// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

void main() {
  runApp(KraHanApp());
}

//**
//Description of code below all code Na, อ่่านด้วยจะได้แก้โค้ดง่าย
// */
class KraHanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
            labelLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            labelMedium: null,
            labelSmall: TextStyle(fontWeight: FontWeight.bold),
            bodyLarge: null,
            bodyMedium: null,
            bodySmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 10)),
      ),
      title: "GraHanApp",
      home: GraHanHomePage(),
    );
  }
}

// ----------------start  KranHanHomePage Class ----------------- //
class GraHanHomePage extends StatefulWidget {
  //TODO 1: Add DebtorList which debtorList contains several Row each Row contain Maintitle as Deptor's Name and Smalltitle as Deptor's Food list and price and on the right of Row contain total amount of that person.
  List<Widget> debtorList = [];
  @override
  State<GraHanHomePage> createState() => _GraHanHomePageState();
}

class _GraHanHomePageState extends State<GraHanHomePage> {
  List<Widget> debtorList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Khor Ther",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        leading: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(30.0), // Adjust the radius as needed
          ),
          backgroundColor: Color.fromARGB(255, 215, 27, 90),
          child: Text(
            "Back",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            // Back Function.
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_outline),
            onPressed: () {
              // Add your action here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 150),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 11, 35, 187),
            ),
            child: Text(
              "SUMMARY",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              child: Container(
                color: Colors.amber,
                child: Column(children: ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 150),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 11, 35, 187),
            ),
            child: Text(
              "PROMPTPAY",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              child: Container(
                color: Colors.black26,
                child: Column(children: [
                  //TODO: check List length of and use for loop to implement num of Row
                  Row(
                    children: [], //TODO: recieve List of name ,food ,price
                  ),
                ]),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Card(
            color: Color.fromARGB(255, 245, 46, 112),
            child: TextButton(
              onPressed: () {},
              child: Text("Confirm And Send Payment"),
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
//**
//texttheme ในส่วนของMaterail กำหนดว่าstyleในText ต่างๆ
//AppBar Contain 'Back button' , 'title', 'icon profile'  -->//TODO:ทำให้backbutton ทำงาน , icon profile ยังเหลือชื่อ
//
//padding ของlabel small เอาไว้ทำให้กล่องยืดหด.
//Expanded อันที่2 มีจำนวนRow ตามinformation ที่เราใส่เข้าไป โดยRowแต่ละRow จะประกอบไปด้วยชื่อคน ชื่ออาหาร ราคา
// */
