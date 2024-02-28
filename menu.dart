import 'package:flutter/material.dart';
import 'package:glaharn/history.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'host.dart';
import 'status.dart';
import 'debtor.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Host Route
            CustomCard(
              title: 'Host',
              description: 'Manage hosting details',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HostPage()),
                );
              },
              icon: Icons.restaurant,
              color: Colors.orange,
            ),
            //Status Route
            CustomCard(
              title: 'Status',
              description: 'View detailed information and display status',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const StatusPage()),
                );
              },
              icon: Icons.healing,
              color: Colors.blue,
            ),
            //Debtor Route
            CustomCard(
              title: 'Debtor',
              description: 'Keep track of debts and repayments',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DebtorPage()),
                );
              },
              icon: Icons.account_balance_wallet,
              color: Colors.green,
            ),
          ],
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
              // case ในการกดปุ่มต่างๆ ว่าจะไปหน้าไหน
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
            // เมนูทั้งหลายตรงappbarด้านล่าง
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
}

// Card ที่กำหนดค่าได้โดยพารามิเตอร์
class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;
  final IconData icon;
  final Color color;

  const CustomCard({
    required this.title,
    required this.description,
    required this.onPressed,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(16),
      color: color,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // จัดตำแหน่งไอคอนและข้อความอยู่ตรงกลาง
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: Colors.white,
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
