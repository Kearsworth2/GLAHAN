// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// หน้านี้มีList ของ foodNames , foodPrices ในการเก็บข้อมูลจากTextfeild
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'status.dart';
import 'debtor.dart';
import 'menu.dart';
import 'history.dart';
import 'data.dart';

class HostPage extends StatefulWidget {
  @override
  _HostPageState createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  //Theme for this page.
  Color cardBackGroundColor = const Color.fromRGBO(255, 164, 71, 1);
  Color topicTextColor = const Color.fromRGBO(58, 77, 57, 1);
  Color inputLabelTextColor = const Color.fromRGBO(252, 236, 221, 1);
  Color buttonColor = const Color.fromRGBO(255, 171, 115, 1);
  //
  int selectedIndex = 2;
  TextEditingController foodNameController = TextEditingController();
  TextEditingController foodPriceController = TextEditingController();
  TextEditingController peopleNameController = TextEditingController();
  bool isPrompaySelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hostMainBackGroundColor,
      appBar: AppBar(
        backgroundColor: hostAppBarColor,
        title: Text('Host',
            style:
                TextStyle(color: hostFontColor, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ==รายการอาหาร==
              Card(
                color: hostCardBackGroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'รายชื่อคน',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: hostFontColor,
                            fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: peopleNameController,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            labelText: 'ชื่อคน',
                            labelStyle: TextStyle(color: hostFontColor)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // Check if the TextField is not empty
                            if (peopleNameController.text.isNotEmpty) {
                              String newPeoplename = peopleNameController.text;

                              debtorNames.add(newPeoplename);
                            }

                            peopleNameController.clear();
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            hostButtonColor,
                          ),
                          elevation: MaterialStateProperty.all<double>(
                              10.0), // Adjust the elevation for the 3D effect
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.black), // Customize the shadow color
                        ),
                        child: Text(
                          'เพิ่มรายชื่อ',
                          style: TextStyle(color: hostFontColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //==สรุป==
              Card(
                color: hostCardBackGroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('รายการอาหาร',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: hostFontColor,
                              fontWeight: FontWeight.bold)),
                      //กรอกชื่ออาหารsection
                      TextField(
                        controller: foodNameController,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            labelText: 'ชื่ออาหาร',
                            labelStyle: TextStyle(color: hostFontColor)),
                      ),
                      //กรอกราคาอาหารsection
                      TextField(
                        controller: foodPriceController,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            labelText: 'ราคาอาหาร',
                            labelStyle: TextStyle(color: hostFontColor)),
                      ),
                      //ปุ่มเพิ่มรูปภาพ
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () => pickImage(),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                hostPhotoButtonColor,
                              ),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Set borderRadius to 0 for a rectangle shape
                                ),
                              ),
                              elevation: MaterialStateProperty.all<double>(
                                  10.0), // Adjust the elevation for the 3D effect
                              shadowColor: MaterialStateProperty.all<Color>(
                                  hostPhotoButtonColor), // Customize the shadow color
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons
                                      .add_photo_alternate, // Replace with the desired icon
                                  color: Colors.white,
                                ),
                                SizedBox(
                                    width:
                                        8.0), // Adjust the spacing between icon and text
                                Text(
                                  'เพิ่มรูปอาหาร',
                                  style: TextStyle(color: hostFontColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // Check if the TextField is not empty
                            if (foodNameController.text.isNotEmpty &&
                                foodPriceController.text.isNotEmpty) {
                              // Getting Value from ชื่ออาหาร Textfeild ในตัวแปร newFoodName.
                              String newFoodName = foodNameController.text;
                              foodNames.add(newFoodName);
                              foodSelections[newFoodName] = false;

                              // Getting Value from ราคาอาหาร Textfeild ในตัวแปร newFoodPrice.
                              String newFoodPrice = foodPriceController.text;
                              foodPrices.add(newFoodPrice);

                              foodNameController.clear();
                              foodPriceController.clear();
                            }
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            hostButtonColor,
                          ),
                          elevation: MaterialStateProperty.all<double>(
                              10.0), // Adjust the elevation for the 3D effect
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.black), // Customize the shadow color
                        ),
                        child: Text(
                          'เพิ่มรายการอาหาร',
                          style: TextStyle(color: hostFontColor),
                        ),
                      ),
                      // Display each foodNames as a topic
                      for (String foodName in foodNames)
                        Column(
                          children: [
                            Text(
                                "$foodName-->ราคา${foodPrices[foodNames.indexOf(foodName)]}",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: topicTextColor,
                                    fontWeight: FontWeight.bold)),
                            // Display checkboxes for each person
                            for (String personName in debtorNames)
                              Row(
                                children: [
                                  Checkbox(
                                    value: foodSelections[foodName] ?? false,
                                    onChanged: (value) {
                                      setState(() {
                                        foodSelections[foodName] =
                                            value ?? false;
                                      });
                                    },
                                  ),
                                  Text(personName),
                                ],
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              //==วิธีการชำระเงินsection==
              Card(
                color: hostCardBackGroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('วิธีการชำระเงิน',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: hostFontColor,
                              fontWeight: FontWeight.bold)),
                      CheckboxListTile(
                        activeColor: hostMainBackGroundColor,
                        title: Text('PromptPay',
                            style: TextStyle(color: hostFontColor)),
                        value: isPrompaySelected,
                        onChanged: (value) {
                          // เปลี่ยนค่า isPrompaySelected ตามที่ checkbox ถูกเลือกหรือไม่
                          setState(() {
                            isPrompaySelected = value!;
                          });
                        },
                      ),
                      CheckboxListTile(
                        activeColor: hostMainBackGroundColor,
                        title: Text('แนบรูป QR Code',
                            style: TextStyle(color: hostFontColor)),
                        value: !isPrompaySelected,
                        onChanged: (value) {
                          setState(() {
                            isPrompaySelected = !value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            hostButtonColor,
                          ),
                        ),
                        onPressed: () {
                          // Confirm press
                        },
                        child: Text('Confirm',
                            style: TextStyle(color: hostFontColor)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // บาร์ด้านล่างที่containปุ่มหน้าต่างๆ
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
                    MaterialPageRoute(builder: (context) => const MenuPage()),
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
                    MaterialPageRoute(builder: (context) => const StatusPage()),
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

// ออกแบบเป็น รายการอาหาร แล้วเป็นติ๊ก ชื่อคนที่ร่วมหาร
}
