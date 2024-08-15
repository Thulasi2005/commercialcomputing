import 'package:flutter/material.dart';

class ElderlyHomeRequestSelectionPage extends StatefulWidget {
  @override
  _ElderlyHomeRequestSelectionPageState createState() => _ElderlyHomeRequestSelectionPageState();
}

class _ElderlyHomeRequestSelectionPageState extends State<ElderlyHomeRequestSelectionPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF21B2C5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Request Selection Type'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose the Type of Request',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                mainAxisSpacing: 16,
                children: [
                  _buildRequestOption(Icons.shopping_basket, 'Item Donation', '/itemDonation'),
                  _buildRequestOption(Icons.volunteer_activism, 'Services Donation', '/homesservice'),
                  _buildRequestOption(Icons.attach_money, 'Money Donation', '/moneyDonation'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'User Activities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildRequestOption(IconData icon, String title, String route) {
    return Card(
      color: Colors.teal[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.teal, width: 2),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80, color: Colors.teal[900]), // Larger icon
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  color: Colors.teal[900],
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ElderlyHomeRequestSelectionPage(),
  ));
}