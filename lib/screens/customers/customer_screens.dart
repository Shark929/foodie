import 'package:flutter/material.dart';
import 'package:foodie/screens/customers/chat_screen.dart';
import 'package:foodie/screens/customers/customer_cart_screen.dart';
import 'package:foodie/screens/customers/customer_home_screen.dart';
import 'package:foodie/screens/customers/customer_order_screen.dart';
import 'package:foodie/screens/customers/customer_profile_screen.dart';
import 'package:foodie/screens/customers/customer_wallet_screen.dart';
import 'package:foodie/screens/customers/notification_screen.dart';

class CustomerScreens extends StatefulWidget {
  final String customerId;
  const CustomerScreens({super.key, required this.customerId});

  @override
  State<CustomerScreens> createState() => _CustomerScreensState();
}

class _CustomerScreensState extends State<CustomerScreens> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      CustomerHomeScreen(
        customerId: widget.customerId,
      ),
      OrderScreen(customerId: widget.customerId),
      // CheckOutScreen(customerId: widget.customerId),
      CustomerWalletScreen(
        customerId: widget.customerId,
      ),
      CustomerProfileScreen(
        customerId: widget.customerId,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Foodie"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomerCartScreen(
                              customerID: widget.customerId,
                            )));
              },
              icon: Icon(
                Icons.shopping_basket_rounded,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen(
                              customerId: widget.customerId,
                            )));
              },
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatScreen(
                            customerId: widget.customerId,
                          )),
                );
              },
              icon: Icon(
                Icons.chat,
                color: Colors.black,
              )),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset("assets/Home.png"),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/food.png"),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/wallet.png"),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/user.png"),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
