import 'package:flutter/material.dart';

class CustomerCartScreen extends StatefulWidget {
  final String customerID;
  const CustomerCartScreen({super.key, required this.customerID});

  @override
  State<CustomerCartScreen> createState() => _CustomerCartScreenState();
}

class _CustomerCartScreenState extends State<CustomerCartScreen> {
  String dineIn = "0";
  String foodieWallet = "1";
  String time = "";
  bool isDineIn = true;
  bool isTakeAway = false;
  bool isFoodieWallet = true;
  bool isCard = false;
  TextEditingController timeController = TextEditingController();
  List orderList = [
    {
      "item_name": "McD",
      "item_price": "10.00",
      "quantity": "2",
      "total_price": "20.00",
      "image":
          "https://firebasestorage.googleapis.com/v0/b/foodie-890a6.appspot.com/o/image%2F1671191137913?alt=media&token=d04ba316-b407-44be-95db-345061535b15",
    },
    {
      "item_name": "McD",
      "item_price": "10.00",
      "quantity": "2",
      "total_price": "20.00",
      "image":
          "https://firebasestorage.googleapis.com/v0/b/foodie-890a6.appspot.com/o/image%2F1671191137913?alt=media&token=d04ba316-b407-44be-95db-345061535b15",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Cart"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: orderList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SizedBox(
                        width: 100,
                        child: Image.network(
                          orderList[index]['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(orderList[index]['item_name']),
                      subtitle: Text(
                          "x${orderList[index]['quantity']}, RM ${orderList[index]['item_price']}"),
                      trailing: Text("RM ${orderList[index]['total_price']}"),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Where would you like to have your meal?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          dineIn = "1";
                          isDineIn = true;
                          isTakeAway = false;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: isDineIn ? Colors.amber : Colors.white,
                                border:
                                    Border.all(color: Colors.amber, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset("assets/dish.png"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Dine In",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          dineIn = "0";
                          isDineIn = false;
                          isTakeAway = true;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: isTakeAway ? Colors.amber : Colors.white,
                                border:
                                    Border.all(color: Colors.amber, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset("assets/take-away.png"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Take Away",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "What time you like to have your meal?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: timeController,
                  onChanged: (value) {
                    setState(() {
                      time = value;
                    });
                  },
                  decoration: const InputDecoration(hintText: "Now or 12 P.M."),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Checkout")),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: () {},
                      child: const Text("Cancel")),
                ),

                // const Text(
                //   "Pay with foodie wallet or card?",
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       foodieWallet = "1";
                //       isFoodieWallet = true;
                //       isCard = false;
                //     });
                //   },
                //   child: Container(
                //       width: double.infinity,
                //       height: 50,
                //       padding: const EdgeInsets.all(10),
                //       decoration: BoxDecoration(
                //           color: isFoodieWallet ? Colors.amber : Colors.white,
                //           border: Border.all(color: Colors.amber, width: 2),
                //           borderRadius: BorderRadius.circular(10)),
                //       child: const Text(
                //         "Foodie Wallet",
                //         style: TextStyle(fontSize: 20),
                //       )),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       foodieWallet = "0";
                //       isFoodieWallet = false;
                //       isCard = true;
                //     });
                //   },
                //   child: Container(
                //     width: double.infinity,
                //     height: 50,
                //     padding: const EdgeInsets.all(10),
                //     decoration: BoxDecoration(
                //         color: isCard ? Colors.amber : Colors.white,
                //         border: Border.all(color: Colors.amber, width: 2),
                //         borderRadius: BorderRadius.circular(10)),
                //     child: const Text(
                //       "Card",
                //       style: TextStyle(fontSize: 20),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
