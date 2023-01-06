import 'package:cloud_firestore/cloud_firestore.dart';
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
            child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Cart").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                if (snapshot.data!.docs[i]['user_id'] == widget.customerId) {
                  return Column(children: [
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
                                color: snapshot.data!.docs[i]['type'] == "2"
                                    ? Colors.amber
                                    : null,
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
                                color: snapshot.data!.docs[i]['type'] == "3"
                                    ? Colors.amber
                                    : null,
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
                                color: snapshot.data!.docs[i]['type'] == "4"
                                    ? Colors.amber
                                    : null,
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
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  snapshot.data!.docs[i]['item_name'],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      "X ${snapshot.data!.docs[i]['quantity']}")),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    "Total: RM ${snapshot.data!.docs[i]['total_price']}"),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]);
                }
              }
            }
            return const SizedBox();
          },
        )),
      )),
    );
  }
}
