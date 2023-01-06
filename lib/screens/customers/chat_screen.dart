import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String customerId;
  const ChatScreen({super.key, required this.customerId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  String message = "";
  /**
   * The logic might be open a chat collection in firebase,
   * once order completed, 
   * DELETE whole chat collection
   */
  List conList = [
    {
      "vendor_id": "qweqwe",
      "user_id": "",
      "message": "Hello",
    },
    {
      "vendor_id": "",
      "user_id": "qweqwe",
      "message": "Hello",
    },
    {
      "vendor_id": "qweqwe",
      "user_id": "",
      "message": "Hello",
    },
    {
      "vendor_id": "",
      "user_id": "qweqwe",
      "message": "Hello",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("McD"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 500,
              width: double.infinity,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: conList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: conList[index]['user_id'] != ""
                            ? Colors.amber
                            : Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: conList[index]['user_id'] != ""
                          ? const EdgeInsets.only(bottom: 10, left: 100)
                          : const EdgeInsets.only(bottom: 10, right: 100),
                      padding: const EdgeInsets.all(10),
                      child: Text(conList[index]['message']),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 250,
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        setState(() {
                          message = value;
                        });
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your message..."),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print(message);
                      messageController.clear();
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
