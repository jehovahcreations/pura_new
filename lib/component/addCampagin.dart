import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/constant.dart';
import '../widget/alert.dart';
import '../widget/text.dart';

class AddCampagin extends StatefulWidget {
  const AddCampagin({super.key});

  @override
  State<AddCampagin> createState() => _AddCampaginState();
}

class _AddCampaginState extends State<AddCampagin> {
  bool loading = false;
  final _addCampaginFormKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {
    'name': null,
    'vendor': null,
    'url': null,
    'payout': null,
    'isActive': 1,
    'image': null
  };

  _upload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      Uint8List? fileBytes = result.files.first.bytes;
      String fileName = result.files.first.name;
      String base64String = base64Encode(fileBytes!);
      String header = "data:image/png;base64,";
      String file = header + base64String;
      formData['image'] = base64String;
    }
  }

  @override
  void initState() {
    socket.on('addNewCampagin', (data) => {response(data)});
    super.initState();
  }

  response(data) {
    if (data == true) {
      alert(context, 'SuccessFull', 'User Added Successfully!!!');
      socket.emit('getAllCampagins', 'state');
    } else {
      alert(context, 'Failed', 'Email already used!!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _addCampaginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textWidget('Add New Campagin', "40", FontWeight.bold, Colors.teal),
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
                  alignLabelWithHint: true, label: Text('Enter Vendor')),
              onSaved: (value) {
                formData['vendor'] = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true, label: Text('Enter Url')),
              onSaved: (value) {
                formData['url'] = value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  alignLabelWithHint: true, label: Text('Enter Payout')),
              onSaved: (value) {
                formData['payout'] = value;
              },
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              // color: teal,
              child: textWidget(
                  'Upload File', '15', FontWeight.w400, Colors.white),
              onPressed: () {
                _upload();
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              // color: teal,
              child: textWidget('Add', '15', FontWeight.w400, Colors.white),
              onPressed: () {
                _submitForm();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    _addCampaginFormKey.currentState!.save();
    socket.emit('addNewCampagin', formData);
    setState(() {
      loading = true;
    });
  }
}
