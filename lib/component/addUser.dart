import 'package:flutter/material.dart';
import 'package:pura_new/widget/text.dart';

import '../constants/constant.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool loading = false;
  final _addUserFormKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {
    'email': null,
    'password': null,
    'name': null,
    'phone': null,
    'state': null,
    'isActive': 1,
    'balance': 0
  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textWidget('Add State Heads', "40", FontWeight.bold, Colors.teal),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          TextFormField(
            decoration: const InputDecoration(
                alignLabelWithHint: true, label: Text('Enter Name')),
            onSaved: (value) {
              formData['name'] = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                alignLabelWithHint: true, label: Text('Enter Phone Number')),
            onSaved: (value) {
              formData['phone'] = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                alignLabelWithHint: true, label: Text('Enter Email')),
            onSaved: (value) {
              formData['email'] = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                alignLabelWithHint: true, label: Text('Enter Password')),
            onSaved: (value) {
              formData['password'] = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
                alignLabelWithHint: true, label: Text('Enter State')),
            onSaved: (value) {
              formData['state'] = value;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            // color: teal,
            child: textWidget('Login', '15', FontWeight.w400, Colors.white),
            onPressed: () {
              _submitForm();
            },
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    _addUserFormKey.currentState!.save();
    print(formData);
    // socket.emit('addNewUser', formData);
    // setState(() {
    //   loading = true;
    // });
  }
}
