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
  String initialValue = "0";

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
                          initialValue = value;
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
                    onPressed: () {}, child: const Text("Top Up")),
              )
            ],
          ),
        ),
      )),
    );
  }
}
