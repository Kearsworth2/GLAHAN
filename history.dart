// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:glaharn/menu.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'status.dart';
import 'debtor.dart';
import 'host.dart';
import 'data.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<History> histories = [];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: ListView.builder(
        itemCount: histories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              color: index % 2 == 0 ? Colors.blueAccent : Colors.tealAccent,
            ),
            child: ListTile(
              title: Text(
                'ชื่อร้าน: ${histories[index].storeName}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('วันที่: ${histories[index].selectedDate}'),
                  Text(
                    'เวลา: ${histories[index].selectedTime.substring(0, 5)}',
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => MenuPage()),
                  (Route<dynamic> route) => false,
                );
              },
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      _showEditDialog(context, index);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      _showDeleteConfirmation(context, index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context);
        },
        child: Icon(Icons.add),
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

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newStoreName = '';
        String selectedDate = '';
        String selectedTime = '';

        return AlertDialog(
          title: Text('เพิ่มประวัติ'),
          content: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.6),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      newStoreName = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'ชื่อร้าน',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (pickedDate != null && pickedDate != DateTime.now()) {
                        setState(() {
                          selectedDate = pickedDate.toString();
                        });
                      }
                    },
                    child: Text('เลือกวันที่'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (pickedTime != null) {
                        setState(() {
                          selectedTime = pickedTime.format(context);
                        });
                      }
                    },
                    child: Text('เลือกเวลา'),
                  ),
                  ElevatedButton(
                    onPressed: () => pickImage(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green,
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
                          Colors.black), // Customize the shadow color
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
                          'เพิ่มรูปร้านอาหาร',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () {
                if (newStoreName.isEmpty ||
                    selectedDate.isEmpty ||
                    selectedTime.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else {
                  setState(() {
                    histories.add(History(
                      storeName: newStoreName,
                      selectedDate: selectedDate,
                      selectedTime: selectedTime,
                      scenarios: [],
                    ));
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('เพิ่ม'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context, int index) {
    String updatedStoreName = histories[index].storeName;
    String updatedSelectedDate = histories[index].selectedDate;
    String updatedSelectedTime = histories[index].selectedTime;

    double contentHeight = 250.0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('แก้ไขชื่อร้าน'),
          content: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: contentHeight,
            ),
            child: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    updatedStoreName = value;
                  },
                  controller:
                      TextEditingController(text: histories[index].storeName),
                  decoration: InputDecoration(
                    labelText: 'ชื่อร้าน',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (pickedDate != null && pickedDate != DateTime.now()) {
                      setState(() {
                        updatedSelectedDate = pickedDate.toString();
                      });
                    }
                  },
                  child: Text('เลือกวันที่'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (pickedTime != null) {
                      setState(() {
                        updatedSelectedTime = pickedTime.format(context);
                      });
                    }
                  },
                  child: Text('เลือกเวลา'),
                ),
                ElevatedButton(
                  onPressed: () => pickImage(),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.green,
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
                        Colors.black), // Customize the shadow color
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
                        'เพิ่มรูปร้านอาหาร',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  histories[index].storeName = updatedStoreName;
                  histories[index].selectedDate = updatedSelectedDate;
                  histories[index].selectedTime = updatedSelectedTime;
                });
                Navigator.of(context).pop();
              },
              child: Text('บันทึก'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmation(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ยืนยันการลบ'),
          content: Text('คุณต้องการลบประวัตินี้ใช่หรือไม่?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () {
                _deleteScenario(index);
                Navigator.of(context).pop();
              },
              child: Text('ลบ'),
            ),
          ],
        );
      },
    );
  }

  void _deleteScenario(int index) {
    setState(() {
      histories.removeAt(index);
    });
  }
}

class History {
  String storeName;
  String selectedDate;
  String selectedTime;
  List<String> scenarios;

  History({
    required this.storeName,
    required this.selectedDate,
    required this.selectedTime,
    required this.scenarios,
  });
}
