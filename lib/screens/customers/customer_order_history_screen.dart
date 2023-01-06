import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatefulWidget {
  final String customerId;
  const OrderHistoryScreen({super.key, required this.customerId});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List orderList = [
    {
      "user_id": "ivan",
      "item_name": "Chicken Mc Deluxe",
      "item_price": "12.90",
      "quantity": "2",
      "total_price": "25.80",
      "restaurant_name": "McD",
      "time": "12/12/12 12:12PM",
    },
    {
      "user_id": "ivan",
      "item_name": "Chicken Mc Deluxe",
      "item_price": "12.90",
      "quantity": "2",
      "total_price": "25.80",
      "restaurant_name": "McD",
      "time": "12/12/12 12:12PM",
    },
    {
      "user_id": "ivan",
      "item_name": "Chicken Mc Deluxe",
      "item_price": "12.90",
      "quantity": "2",
      "total_price": "25.80",
      "restaurant_name": "McD",
      "time": "12/12/12 12:12PM",
    },
    {
      "user_id": "ivan",
      "item_name": "Chicken Mc Deluxe",
      "item_price": "12.90",
      "quantity": "2",
      "total_price": "25.80",
      "restaurant_name": "McD",
      "time": "12/12/12 12:12PM",
    },
    {
      "user_id": "ivan",
      "item_name": "Chicken Mc Deluxe",
      "item_price": "12.90",
      "quantity": "2",
      "total_price": "25.80",
      "restaurant_name": "McD",
      "time": "12/12/12 12:12PM",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Order History"),
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
                  itemCount: orderList.length,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      title: Text(orderList[index]['restaurant_name']),
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            orderList[index]['item_name'],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Quantity: x${orderList[index]['quantity']}",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Price: RM${orderList[index]['item_price']}",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Total: RM  ${orderList[index]['total_price']}",
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            orderList[index]['time'],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  })
            ],
          ),
        ),
      )),
    );
  }
}
