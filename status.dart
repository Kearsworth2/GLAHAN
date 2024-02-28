// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'host.dart';
import 'debtor.dart';
import 'menu.dart';
import 'history.dart';
import 'data.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  int selectedIndex = 3;
  final pricePerPerson = [PricePerPerson("Kears", 800)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: statusMainBackGroundColor,
      appBar: AppBar(
        backgroundColor: statusAppBarColor,
        title: Text(
          'Status',
          style: TextStyle(
              fontFamily: "openSan",
              color: statusFontColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Center(
              child: Card(
                color: statusCardBackGroundColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Deptor',
                          style: TextStyle(
                              color: statusFontColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Total',
                          style: TextStyle(
                              color: statusFontColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Status',
                          style: TextStyle(
                              color: statusFontColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    // ListView.builder(
                    //   itemCount: pricePerPerson.length,
                    //   itemBuilder: (context, index) {
                    //     return Row(
                    //       children: [
                    //         ListTile(
                    //           title:
                    //               Text('Name: ${pricePerPerson[index].name}'),
                    //           subtitle:
                    //               Text('Price: ${pricePerPerson[index].price}'),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // ),

                    //เพิ่ม Row ของข้อมูลDeptor Total Status -- > ทำเป็นConstructor.
                  ],
                ),
              ),
            )),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey,
            padding: const EdgeInsets.all(16),
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
              switch (index) {
                case 0:
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HistoryPage()),
                    (Route<dynamic> route) => false,
                  );
                  break;
                case 1:
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MenuPage()),
                    (Route<dynamic> route) => false,
                  );
                  break;
                case 2:
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HostPage()),
                    (Route<dynamic> route) => false,
                  );
                  break;
                case 3:
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => StatusPage()),
                    (Route<dynamic> route) => false,
                  );
                  break;
                case 4:
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => DebtorPage()),
                    (Route<dynamic> route) => false,
                  );
                  break;
              }
            },
            tabs: const [
              GButton(
                icon: Icons.history_edu_rounded,
                text: 'History',
              ),
              GButton(
                icon: Icons.menu_open,
                text: 'Menu',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Host',
              ),
              GButton(
                icon: Icons.search,
                text: 'Status',
              ),
              GButton(
                icon: Icons.settings,
                text: 'Debtor',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to add a new food item
  void _addFood() {
    setState(() {
      String newFoodName =
          "New Food"; // Replace with your desired default value
      foodNames.add(newFoodName);
      foodSelections[newFoodName] = false;
    });
  }
}

void confirmation() {}
