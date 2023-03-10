import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:foodie/screens/customers/customer_edit_profile_screen.dart';
import 'package:foodie/screens/customers/customer_order_history_screen.dart';
import 'package:foodie/screens/switch_screen.dart';
import 'package:image_picker/image_picker.dart';

class CustomerProfileScreen extends StatefulWidget {
  final String customerId;
  const CustomerProfileScreen({super.key, required this.customerId});

  @override
  State<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  ImagePicker imagePicker = ImagePicker();
  XFile? file;
  String imageUrl = "";
  bool isLoading = false;
  bool canUpload = false;
  void pickImage() async {
    isLoading = true;
    file = await imagePicker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    String uniqueName = DateTime.now().millisecondsSinceEpoch.toString();
    // upload to firebase storage
    // get a reference to storage root
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('image');

    //create a reference for the image to be stored
    Reference referenceImageToUpload = referenceDirImages.child(uniqueName);

    //handle errors
    try {
      //Store the file
      await referenceImageToUpload.putFile(File(file!.path));

      imageUrl = await referenceImageToUpload.getDownloadURL();
      if (imageUrl != null) {
        setState(() {
          isLoading = false;
          canUpload = true;
        });
        FirebaseFirestore.instance
            .collection("Users")
            .doc(widget.customerId)
            .update({
          "image": imageUrl,
        });
      }
      print(imageUrl);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(widget.customerId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!['image'] == "") {
                    return InkWell(
                      onTap: pickImage,
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        alignment: Alignment.center,
                        color: Colors.amber[300],
                        child: Text("Add a photo"),
                      ),
                    );
                  } else if (snapshot.data!['image'] != "") {
                    return InkWell(
                      onTap: pickImage,
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              snapshot.data!['image'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }
                }
                return const SizedBox();
              }),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomerEditProfile(
                            customerId: widget.customerId,
                          )));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Edit Profile"),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset("assets/forward.png"),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(widget.customerId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(snapshot.data!['customer_email']),
                  );
                }
                return const SizedBox();
              }),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(widget.customerId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(snapshot.data!['customer_phone']),
                  );
                }
                return const SizedBox();
              }),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderHistoryScreen(
                            customerId: widget.customerId,
                          )));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Order history"),
                  Image.asset("assets/forward.png"),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SwitchScreen()),
                      (route) => false);
                },
                child: const Text("Logout")),
          )
        ]),
      )),
    );
  }
}
