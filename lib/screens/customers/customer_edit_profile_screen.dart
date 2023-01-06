import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie/components/edit_input.dart';

class CustomerEditProfile extends StatefulWidget {
  final String customerId;
  const CustomerEditProfile({super.key, required this.customerId});

  @override
  State<CustomerEditProfile> createState() => _CustomerEditProfileState();
}

class _CustomerEditProfileState extends State<CustomerEditProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Edit Profile"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              EditInputComponent(
                  label: "Email",
                  hintText: "ivan@gmail.com",
                  function: () {},
                  controller: emailController),
              const SizedBox(
                height: 20,
              ),
              EditInputComponent(
                  label: "Phone",
                  hintText: "01133869910",
                  function: () {},
                  controller: phoneController),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
