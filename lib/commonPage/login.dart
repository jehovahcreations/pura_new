import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../component/logo.dart';
import '../constants/color.dart';
import '../widget/text.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFormKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {'email': null, 'password': null};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ignore: prefer_const_constructors
            SafeArea(
              top: true,
              minimum: const EdgeInsets.all(30),
              child: Text(''),
            ),
            Column(
              children: [
                innerLogo(context),
                Shimmer(
                    duration: const Duration(seconds: 3), //Default value
                    interval: const Duration(
                        seconds: 1), //Default value: Duration(seconds: 0)
                    color: Colors.black, //Default value
                    colorOpacity: 0, //Default value
                    enabled: true, //Default value
                    direction: const ShimmerDirection.fromLTRB(),
                    child: textWidget('PURA', '40', FontWeight.w700, white)),
                textWidget(
                    'SOCIAL JUSTICE MOVEMENT', '8', FontWeight.w600, grey)
              ],
            ),
            Form(
              key: _loginFormKey,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          textWidget('Login', '25', FontWeight.w500, teal),
                          TextFormField(
                            decoration: const InputDecoration(
                                alignLabelWithHint: true,
                                label: Text('Enter Email')),
                            onSaved: (value) {
                              formData['email'] = value;
                            },
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                alignLabelWithHint: true,
                                label: Text('Enter Password')),
                            onSaved: (value) {
                              formData['password'] = value;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          RaisedButton(
                            color: teal,
                            child: textWidget(
                                'Login', '15', FontWeight.w400, white),
                            onPressed: () {
                              _submitForm();
                            },
                          ),
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    _loginFormKey.currentState!.save();
    print(formData);
  }
}
