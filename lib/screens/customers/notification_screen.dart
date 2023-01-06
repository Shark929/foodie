import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  final String customerId;
  const NotificationScreen({super.key, required this.customerId});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List notificationList = [
    {
      "restaurant_name": "McD",
      "message": "We are preparing your food",
    },
    {
      "restaurant_name": "McD",
      "message": "We are preparing your food",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: notificationList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(notificationList[index]['restaurant_name']),
                      subtitle: Text(notificationList[index]['message']),
                    );
                  })
            ],
          ),
        ),
      )),
    );
  }
}
