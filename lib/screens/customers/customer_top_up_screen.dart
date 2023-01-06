import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/success_dialog.dart';

class CustomerTopUpScreen extends StatefulWidget {
  final String customerId;
  final double balance;
  const CustomerTopUpScreen(
      {super.key, required this.customerId, required this.balance});

  @override
  State<CustomerTopUpScreen> createState() => _CustomerTopUpScreenState();
}

class _CustomerTopUpScreenState extends State<CustomerTopUpScreen> {
  TextEditingController amountController = TextEditingController();
  String topUpAmount = "0";

  bool amountEmpty = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Top up"),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Enter your amount"),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          topUpAmount = value;
                        });
                      },
                      keyboardType: TextInputType.number,
                      controller: amountController,
                      decoration: const InputDecoration(hintText: "RM 20.00"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      DateTime now = DateTime.now();
                      double newBalance =
                          widget.balance + double.parse(topUpAmount);
                      FirebaseFirestore.instance
                          .collection("UserWallet")
                          .doc(widget.customerId)
                          .update({
                        "balance": newBalance.toStringAsFixed(2)
                      }).then((value) {
                        FirebaseFirestore.instance
                            .collection("Transactions")
                            .add({
                          "amount": topUpAmount,
                          "time":
                              "${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}",
                          "type": "1",
                          "user_id": widget.customerId,
                        });
                      }).then((value) => Navigator.pop(context));
                    },
                    child: const Text("Top Up")),
              )
            ],
          ),
        ),
      )),
    );
  }
}
