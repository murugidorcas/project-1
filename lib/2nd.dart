import 'package:flutter/material.dart';

class ActivitiesPage extends StatelessWidget {
  final List<Activity> activities = [
    Activity(
      name: 'Yoga Class',
      time: '8:00 AM - 9:00 AM',
      snacks: 'Fruit Salad, Smoothies',
      price: '150',
    ),
    Activity(
      name: 'Cooking Workshop',
      time: '10:00 AM - 12:00 PM',
      snacks: 'Cookies, Coffee',
      price: '300',
    ),
    Activity(
      name: 'Guided Hike',
      time: '1:00 PM - 3:00 PM',
      snacks: 'Granola Bars, Water',
      price: '200',
    ),
    Activity(
      name: 'Wine Tasting',
      time: '4:00 PM - 6:00 PM',
      snacks: 'Cheese Platter, Crackers',
      price: '250',
    ),
    Activity(
      name: 'dance classes',
      time: '7:00 PM - 9:00 PM',
      snacks: 'Pizza, Soft Drinks',
      price: '350',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Activities'),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(activity.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Time: ${activity.time}'),
                  Text('Snacks: ${activity.snacks}'),
                  Text('Price: ${activity.price}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Activity {
  final String name;
  final String time;
  final String snacks;
  final String price;

  Activity({
    required this.name,
    required this.time,
    required this.snacks,
    required this.price,
  });
}