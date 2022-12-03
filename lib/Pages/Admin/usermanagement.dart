import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constants/constant.dart';

class UserManagementAdmin extends StatefulWidget {
  const UserManagementAdmin({super.key});

  @override
  State<UserManagementAdmin> createState() => _UserManagementAdminState();
}

class _UserManagementAdminState extends State<UserManagementAdmin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUser();
    socket.on('getUser', (data) => print(data));
  }

  void getAllUser() {
    socket.emit('getAllUsers', 'data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.teal,
                        width: 1.0,
                        style: BorderStyle.solid), //Border.all

                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [],
                  )),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.teal,
                        width: 1.0,
                        style: BorderStyle.solid), //Border.all

                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
