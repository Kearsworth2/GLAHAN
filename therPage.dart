import 'package:flutter/material.dart';

class TherPage extends StatefulWidget {
  @override
  _TherPageState createState() => _TherPageState();
}

class _TherPageState extends State<TherPage> {
  int selectedIndex = 2;
  List<String> foodNames = [];
  Map<String, bool> foodSelections = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top Section
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Debtor', style: TextStyle(fontSize: 30.0)),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Payment Method',
                                style: TextStyle(fontSize: 18.0)),
                            // Add any specific payment method information here
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _addFood,
                      child: Text('Add'),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous page
                  },
                  child: Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // โค้ดสำหรับยืนยัน
                  },
                  child: Text('Confirm'),
                ),
              ],
            )
          ],
        ),
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
            tabBackgroundColor: Colors.greenAccent,
            padding: const EdgeInsets.all(16),
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
              switch (index) {
                case 0:
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MenuPage()),
                  );
                  break;
                case 1:
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HostPage()),
                  );
                  break;
                case 2:
                  break;
                case 3:
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => DebtorPage()),
                  );
                  break;
              }
            },
            tabs: const [
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
                text: 'Ther',
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
