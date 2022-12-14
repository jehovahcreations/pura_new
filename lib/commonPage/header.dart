import 'package:flutter/material.dart';
import 'package:pura_new/widget/text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String? name;
  int bal = 0;
  @override
  void initState() {
    super.initState();
    _startData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: const BoxDecoration(
        color: Colors.teal,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.verified_user,
                color: Colors.white,
              ),
              textWidget(name, '20', FontWeight.bold, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.balance,
                color: Colors.white,
              ),
              textWidget(bal.toString(), '20', FontWeight.bold, Colors.white),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                textWidget('Logout', '20', FontWeight.bold, Colors.white),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _startData() async {
    final prefs = await SharedPreferences.getInstance();
    var uname = prefs.getString('name');
    final balance = prefs.getInt('balance');

    setState(() {
      name = uname;
      bal = balance ?? 0;
    });
  }
}
