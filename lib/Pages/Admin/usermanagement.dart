import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pura_new/Pages/Admin/dashboad.dart';
import 'package:pura_new/widget/text.dart';

import '../../component/addUser.dart';
import '../../constants/constant.dart';

class UserManagementAdmin extends StatefulWidget {
  const UserManagementAdmin({super.key});

  @override
  State<UserManagementAdmin> createState() => _UserManagementAdminState();
}

class _UserManagementAdminState extends State<UserManagementAdmin> {
  List result = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    getAllUser();
    socket.on('getUser', (data) {
      if (mounted) {
        setState(() {
          result = data;
        });

        isLoading = false;
      }
      print(result);
    });
  }

  @override
  void dispose() {
    print('Dispose used');
    super.dispose();
  }

  void getAllUser() {
    socket.emit('getUsersByRole', 'state');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
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
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.teal,
                        )
                      : SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: textWidget('State Heads', '40',
                                    FontWeight.bold, Colors.teal),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  padding: const EdgeInsets.only(top: 10),
                                  itemCount: result.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(
                                        bottom: 10, right: 10, left: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey[100],
                                      boxShadow: const [BoxShadow()],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              textWidget('name : ', '14',
                                                  FontWeight.w500, Colors.teal),
                                              textWidget(
                                                  result[index]['name'],
                                                  '14',
                                                  FontWeight.w500,
                                                  Colors.black)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              textWidget('phone : ', '14',
                                                  FontWeight.w500, Colors.teal),
                                              textWidget(
                                                  result[index]['phone'],
                                                  '14',
                                                  FontWeight.w500,
                                                  Colors.black)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              textWidget('email : ', '14',
                                                  FontWeight.w500, Colors.teal),
                                              textWidget(
                                                  result[index]['email'],
                                                  '14',
                                                  FontWeight.w500,
                                                  Colors.black)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              textWidget('State : ', '14',
                                                  FontWeight.w500, Colors.teal),
                                              textWidget(
                                                  result[index]['state'],
                                                  '14',
                                                  FontWeight.w500,
                                                  Colors.black)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              textWidget('Balance : ', '14',
                                                  FontWeight.w500, Colors.teal),
                                              textWidget(
                                                  result[index]['balance'],
                                                  '14',
                                                  FontWeight.w500,
                                                  Colors.black)
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              result[index]['isActive'] == 1
                                                  ? ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      7,
                                                                      155,
                                                                      98))),
                                                      // color: teal,
                                                      child: textWidget(
                                                          'De - Activate',
                                                          '15',
                                                          FontWeight.w400,
                                                          Colors.white),
                                                      onPressed: () {
                                                        // _submitForm();
                                                      },
                                                    )
                                                  : ElevatedButton(
                                                      // color: teal,
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    7,
                                                                    155,
                                                                    98)),
                                                      ),
                                                      child: textWidget(
                                                          'Activate',
                                                          '15',
                                                          FontWeight.w400,
                                                          Colors.white),
                                                      onPressed: () {
                                                        // _submitForm();
                                                      },
                                                    ),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(const Color
                                                                    .fromARGB(
                                                                255,
                                                                7,
                                                                155,
                                                                98))),
                                                // color: teal,
                                                child: textWidget(
                                                    'Delete',
                                                    '15',
                                                    FontWeight.w400,
                                                    Colors.white),
                                                onPressed: () {
                                                  // _submitForm();
                                                },
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                  child: const AddUser()),
            ),
          ),
        ],
      ),
    );
  }
}
