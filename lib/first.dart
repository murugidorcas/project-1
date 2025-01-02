import 'package:flutter/material.dart';

void main() {
  runApp(HotelApp());
}

class HotelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel App'),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Room Booking'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomBookingPage()),
                );
              },
            ),
            ListTile(
              title: Text('Prices'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PricesPage()),
                );
              },
            ),
            ListTile(
              title: Text('Services Offered'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to our Hotel!'),
      ),
    );
  }
}

class RoomBookingPage extends StatefulWidget {
  @override
  _RoomBookingPageState createState() => _RoomBookingPageState();
}

class _RoomBookingPageState extends State<RoomBookingPage> {
  String _selectedRoom = 'luxury-suite';
  final Map<String, Map<String, dynamic>> roomInfo = {
    'luxury-suite': {
      'price': '\$250 per night',
      'capacity': 'Max Occupancy: 4 Adults + 2 Kids',
      'services': ['King Bed', 'Jacuzzi', 'Sea View', 'Free Wi-Fi', 'Breakfast Included']
    },
    'deluxe-room': {
      'price': '\$180 per night',
      'capacity': 'Max Occupancy: 2 Adults + 1 Child',
      'services': ['Queen Bed', 'City View', 'Free Wi-Fi', 'Breakfast Included']
    },
    'standard-room': {
      'price': '\$120 per night',
      'capacity': 'Max Occupancy: 2 Adults',
      'services': ['Double Bed', 'Garden View', 'Free Wi-Fi']
    },
    'single-room': {
      'price': '\$80 per night',
      'capacity': 'Max Occupancy: 1 Adult',
      'services': ['Single Bed', 'City View', 'Free Wi-Fi']
    },
    'family-suite': {
      'price': '\$300 per night',
      'capacity': 'Max Occupancy: 5 Adults + 2 Kids',
      'services': ['Two Queen Beds', 'Living Area', 'Sea View', 'Free Wi-Fi', 'Breakfast Included']
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Booking'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Room Booking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedRoom,
              icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
              onChanged: (String? newRoom) {
                setState(() {
                  _selectedRoom = newRoom!;
                });
              },
              items: <String>[
                'luxury-suite',
                'deluxe-room',
                'standard-room',
                'single-room',
                'family-suite',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value.replaceAll('-', ' ').toUpperCase(),
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Room Details:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Price: ${roomInfo[_selectedRoom]?['price']}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Capacity: ${roomInfo[_selectedRoom]?['capacity']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Services:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (roomInfo[_selectedRoom]?['services'] as List<String>)
                  .map((service) => Text(
                        '- $service',
                        style: TextStyle(fontSize: 16),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action to confirm the booking
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Booking confirmed for $_selectedRoom!')));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text(
                'Confirm Booking',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PricesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prices'),
      ),
      body: Center(
        child: Text('Prices Page'),
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services Offered'),
      ),
      body: Center(
        child: Text('Services Offered Page'),
      ),
    );
  }
}