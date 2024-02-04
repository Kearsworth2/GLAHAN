// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:krahan/deptorContainer.dart';

void main() {
  runApp(KraHanApp());
}

class KraHanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GraHanApp",
      home: GraHanHomePage(),
    );
  }
}

// ----------------start  KranHanHomePage Class ----------------- //
class GraHanHomePage extends StatefulWidget {
  @override
  State<GraHanHomePage> createState() => _GraHanHomePageState();
}

class _GraHanHomePageState extends State<GraHanHomePage> {
  @override
  void initState() {
    super.initState();
    collectData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 2, 222),
      appBar: AppBar(
        title: Text(
          "GraHan",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 56, 0, 151),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(
                Icons.person_2_outlined,
                color: Colors.red,
              ),
              onPressed: showProfileInfo,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            width: 400,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 150, 141, 232),
                border: Border.all(
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(40)),
            child: Column(
              children: [
                Column(children: [
                  Container(
                    padding: EdgeInsets.all(1.0),
                    child: RoundedWrapperDeptor(
                      child: Text(
                        "Deptor",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  deptorContainer("Kears", 1),
                  SizedBox(
                    height: 5,
                  ),
                  deptorContainer("Dol", 10000000),
                  SizedBox(
                    height: 5,
                  ),
                  deptorContainer("Mon", 5000000),
                  SizedBox(
                    height: 5, // ---> edit ด้วย ปุ่มมันยังไม่เป็นอิสระ
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Add button press logic here
              },
              child: Text('Back to Menu'),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {}),
        tooltip: 'Increment Counter',
        child: const Text("KraHan"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
// ----------------end  KranHanHomePage Class ----------------- //

class RoundedWrapperDeptor extends StatelessWidget {
  final Widget child;

  RoundedWrapperDeptor({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 0, 10, 157), // Change the color as needed
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: child,
    );
  }
}

// --------------- function ------------ //
void showProfileInfo() {}
void collectData() {}
// -------------------------------------- //