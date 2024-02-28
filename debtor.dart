// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'host.dart';
import 'status.dart';
import 'menu.dart';
import 'history.dart';
import 'data.dart';

class DebtorPage extends StatefulWidget {
  @override
  _DebtorPageState createState() => _DebtorPageState();
}

class _DebtorPageState extends State<DebtorPage> {
  int selectedIndex = 4;
  bool isPrompaySelected = false;
  //TODO: Loop through peopleName and pricePereach and assign to this CardData
  List<CardData> cardDataList = [
    CardData(name: 'Kears', number: '123456'),
    CardData(name: 'Jane', number: '789012'),
    // Add more card data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: debtorMainBackGroundColor,
      appBar: AppBar(
        backgroundColor: debtorAppBarColor,
        title: Text(
          'Debter',
          style: TextStyle(color: debtorFontColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: cardDataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _editNumber(index);
            },
            child: Card(
              color: debtorCardBackGroundColor,
              child: ListTile(
                title: Text(
                  "ชื่อ: ${cardDataList[index].name}",
                  style: TextStyle(color: debtorFontColor),
                ),
                subtitle: Text("จำนวน: ${cardDataList[index].number} บาท",
                    style: TextStyle(color: debtorFontColor)),
              ),
            ),
          );
        },
      ), // บาร์ด้านล่างที่containปุ่มหน้าต่างๆ
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

  void _editNumber(int index) {
    // Display a dialog or navigate to a new screen to edit the number
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Number'),
          content: TextField(
            controller: TextEditingController(text: cardDataList[index].number),
            onChanged: (newNumber) {
              setState(() {
                cardDataList[index].number = newNumber;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Save the edited number
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class CardData {
  final String name;
  String number;

  CardData({required this.name, required this.number});
}

//TODO: Add Theme
Color mainBackGroundColor = const Color.fromRGBO(18, 55, 42, 1);
Color cardBackGroundColor = const Color.fromRGBO(67, 104, 80, 1);
Color topicTextColor = const Color.fromRGBO(173, 188, 159, 1);
Color inputLabelTextColor = const Color.fromRGBO(251, 250, 218, 1);
