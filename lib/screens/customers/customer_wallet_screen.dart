import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/screens/customers/customer_top_up_screen.dart';

class CustomerWalletScreen extends StatefulWidget {
  final String customerId;
  const CustomerWalletScreen({super.key, required this.customerId});

  @override
  State<CustomerWalletScreen> createState() => _CustomerWalletScreenState();
}

class _CustomerWalletScreenState extends State<CustomerWalletScreen> {
  List transactionList = [
    {
      "user_id": "ivan",
      "type": "1",
      "amount": "10.00",
      "time": "12/12/12 12:12",
    },
    {
      "user_id": "ivan",
      "type": "1",
      "amount": "10.00",
      "time": "12/12/12 12:12",
    },
    {
      "user_id": "ivan",
      "type": "2",
      "amount": "10.00",
      "time": "12/12/12 12:12",
    },
    {
      "user_id": "ivan",
      "type": "3",
      "amount": "10.00",
      "time": "12/12/12 12:12",
    },
  ];
  double vendorBalance = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("UserWallet")
                    .doc(widget.customerId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Image.asset("assets/qr.png")),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CustomerTopUpScreen(
                                        customerId: "", balance: 0)));
                          },
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            padding: const EdgeInsetsDirectional.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffeb721a)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "Foodie Wallet",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Text(
                                  "Balance",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "RM 0.00",
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    const Text(
                                      "Top up",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Transactions",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: transactionList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Image.asset(
                                    transactionList[index]['type'] == "1"
                                        ? "assets/top-up.png"
                                        : transactionList[index]['type'] == "2"
                                            ? "assets/dish.png"
                                            : "assets/cashback.png"),
                                title: Text(transactionList[index]['type'] ==
                                        "1"
                                    ? "Top up"
                                    : transactionList[index]['type'] == "2"
                                        ? "Foods"
                                        : transactionList[index]['type'] == "3"
                                            ? "Refund"
                                            : ""),
                                subtitle: Text(transactionList[index]['time']),
                                trailing: Text(
                                  "RM ${transactionList[index]['amount']}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            })
                      ],
                    );
                  }
                  return const SizedBox();
                },
              )),
        ),
      ),
    );
  }
}
