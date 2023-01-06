import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/screens/vendors/chat_screen.dart';
import 'package:foodie/screens/vendors/home_screen.dart';

class OrderDetails extends StatefulWidget {
  final QueryDocumentSnapshot data;
  const OrderDetails({super.key, required this.data});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("#953"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/foodie-890a6.appspot.com/o/image%2F1671191137913?alt=media&token=d04ba316-b407-44be-95db-345061535b15",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                "McD",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Quantity: x2"),
              const SizedBox(
                height: 20,
              ),
              Text("RM 10.00"),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreenVendor(
                                  itemName: widget.data['item_name'],
                                  vendor: widget.data['vendor_id'],
                                  customer: widget.data['user_id'])));
                    },
                    child: Text("Chat with customer")),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      /**
                       * Update cart
                       */
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        "Accept",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
