import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  final String customerId;
  const OrderScreen({super.key, required this.customerId});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List orderDetails = [
    {
      "item_name": "Korean Chicken",
      "quantity": "2",
      "total_price": "81.20",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(30),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "assets/cooking.png",
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/circle.png",
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Order accepted",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 12),
                      width: 5,
                      height: 30,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/circle.png",
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Chef is preparing",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 12),
                      width: 5,
                      height: 30,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/circle.png",
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text(
                        "Order completed",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ExpansionTile(
                    title: const Text("Order Details"),
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: orderDetails.length,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(orderDetails[index]['item_name']),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("X ${orderDetails[index]['quantity']}"),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    "Total: RM ${orderDetails[index]['total_price']}"),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
