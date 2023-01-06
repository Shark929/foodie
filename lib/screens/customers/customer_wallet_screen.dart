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
    print(widget.customerId);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(widget.customerId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data!['wallet'] == "") {
              return Center(
                child: ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection("UserWallet")
                          .doc(widget.customerId)
                          .set({
                        "balance": "0",
                      }).then(
                        (value) => snapshot.data!.reference.update(
                          {
                            "wallet": widget.customerId,
                          },
                        ),
                      );
                    },
                    child: const Text("Open my wallet")),
              );
            } else {
              return Padding(
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
                                        builder: (context) =>
                                            CustomerTopUpScreen(
                                                customerId: widget.customerId,
                                                balance: double.parse(snapshot
                                                    .data!['balance']))));
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                          "RM ${double.parse(snapshot.data!['balance']).toStringAsFixed(2)}",
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
                            StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection("Transactions")
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          if (snapshot.data!.docs[index]
                                                  ['user_id'] ==
                                              widget.customerId) {
                                            return ListTile(
                                              leading: Image.asset(snapshot
                                                              .data!.docs[index]
                                                          ['type'] ==
                                                      "1"
                                                  ? "assets/top-up.png"
                                                  : snapshot.data!.docs[index]
                                                              ['type'] ==
                                                          "2"
                                                      ? "assets/dish.png"
                                                      : "assets/cashback.png"),
                                              title: Text(snapshot
                                                              .data!.docs[index]
                                                          ['type'] ==
                                                      "1"
                                                  ? "Top up"
                                                  : snapshot.data!.docs[index]
                                                              ['type'] ==
                                                          "2"
                                                      ? "Foods"
                                                      : snapshot.data!.docs[
                                                                      index]
                                                                  ['type'] ==
                                                              "3"
                                                          ? "Refund"
                                                          : ""),
                                              subtitle: Text(snapshot
                                                  .data!.docs[index]['time']),
                                              trailing: Text(
                                                "RM ${double.parse(snapshot.data!.docs[index]['amount']).toStringAsFixed(2)}",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            );
                                          }
                                          return const SizedBox();
                                        });
                                  }
                                  return const SizedBox();
                                })
                          ],
                        );
                      }
                      return const SizedBox();
                    },
                  ));
            }
            return const SizedBox();
          },
        )),
      ),
    );
  }
}
