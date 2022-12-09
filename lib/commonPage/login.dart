import 'package:flutter/material.dart';
import 'package:pura_new/constants/color.dart';
import 'package:pura_new/constants/constant.dart';
import 'package:pura_new/model/user.dart';
import 'package:pura_new/widget/alert.dart';
import 'package:pura_new/widget/textFormField.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../Pages/Admin/dashboad.dart';
import '../component/logo.dart';
import '../widget/text.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFormKey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {'email': null, 'password': null};
  bool loading = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    socket.on('alert', (data) {
      setState(() {
        loading = false;
      });
      alert(context, "Login", data);
    });
    socket.on('login', (data) {
      prefss(data);
    });

    super.initState();
  }

  prefss(data) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('email', data['email']);
    await prefs.setString('role', data['role']);
    await prefs.setString('_id', data['_id']);
    await prefs.setString('socket', data['socket']);
    await prefs.setBool('isLoggedIn', true);
    UserModel.email = data['email'];
    UserModel.role = data['role'];
    UserModel.id = data['_id'];
    UserModel.socketId = data['socket'];
    UserModel.isLoggedIn = true;

    setState(() {
      loading = false;
    });
    if (data['role'] == "admin" && mounted) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AdminDashBoard()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? loadingimg(context)
        : Scaffold(
            backgroundColor: Colors.teal,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      logo(context),
                      Shimmer(
                          duration: const Duration(seconds: 3), //Default value
                          interval: const Duration(
                              seconds: 1), //Default value: Duration(seconds: 0)
                          color: Colors.black, //Default value
                          colorOpacity: 0, //Default value
                          enabled: true, //Default value
                          direction: const ShimmerDirection.fromLTRB(),
                          child: textWidget(
                              'PURA', '130', FontWeight.w700, Colors.white)),
                      textWidget('SOCIAL JUSTICE MOVEMENT', '23',
                          FontWeight.w600, grey)
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Form(
                    key: _loginFormKey,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textWidget('Login', '25', FontWeight.w700, teal),
                            const SizedBox(
                              height: 40,
                            ),
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
                              height: 40,
                            ),
                            ElevatedButton(
                              // color: teal,
                              child: textWidget(
                                  'Login', '15', FontWeight.w400, Colors.white),
                              onPressed: () {
                                _submitForm();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }

  void _submitForm() {
    _loginFormKey.currentState!.save();
    print(formData);
    socket.emit('login', formData);
    setState(() {
      loading = true;
    });
  }
}
