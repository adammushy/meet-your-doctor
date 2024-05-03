// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_doctor/constants/app_constants.dart';
import 'package:meet_your_doctor/providers/user_management_provider.dart';
import 'package:meet_your_doctor/shared-functions/float_snackbar.dart';
import 'package:meet_your_doctor/shared-functions/float_snackbar.dart';
// import 'package:meet_your_doctor/shared-functions/progress_dialog.dart';
import 'package:meet_your_doctor/shared-functions/snack_bar.dart';
import 'package:meet_your_doctor/shared-preference-manager/preference-manager.dart';
import 'package:meet_your_doctor/views/screens/auth/register_doctor.dart';
import 'package:meet_your_doctor/views/screens/auth/register_patient.dart';
// import 'package:meet_your_doctor/views/screens/auth/register_user.dart';
import 'package:meet_your_doctor/views/screens/menu/bottom_nav_bar.dart';
// import 'package:meet_your_doctor/views/screens/profile/edit_additional_details.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _deviceToken;
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  bool isLoading = false;
  // final storage = FlutterSecureStorage();

  var user_id;

  var username;
  // Future<void> _checkAndRetrieveDeviceToken() async {
  //   String? storedToken = await storage.read(key: 'deviceToken');
  //   if (storedToken == null) {
  //     // No stored token, retrieve new one
  //     String? newToken = await FirebaseMessaging.instance.getToken();
  //     if (newToken != null) {
  //       setState(() {
  //         _deviceToken = newToken;
  //       });
  //       await storage.write(key: 'deviceToken', value: newToken);
  //     }
  //     print("NO STORED TOKEN  NEW TOKEN IS $newToken");
  //   } else {
  //     // Use stored token
  //     setState(() {
  //       _deviceToken = storedToken;
  //     });
  //     print("STORED TOKEN IS $storedToken");
  //   }
  // }

  getUserId() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString("user");
    setState(() {
      user_id = jsonDecode(user!)['id'];
      username = jsonDecode(user)['username'];
    });
  }

  @override
  void initState() {
    super.initState();
    // _checkAndRetrieveDeviceToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Image.asset(
                      fit: BoxFit.cover,
                      "assets/images/logo.png",
                      width: 400,
                      height: 200,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    textDirection: TextDirection.ltr,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          // fontFamily: ,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 24, top: 36, right: 16),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFF92306),
                              width: 1.2,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            final RegExp emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            }
                            if (!emailValid.hasMatch(value)) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                          controller: _emailController,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Color(0xFF393939),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: const InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Color(0xFFF92306),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 24, top: 16, right: 16),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFF92306),
                              width: 1.2,
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: TextFormField(
                          obscureText: _obscurePassword,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Color(0xFFFF0404), fontSize: 12),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                              icon: _obscurePassword
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: isLoading
                            ? CircularProgressIndicator()
                            : ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: SizedBox(
                                  width: 329,
                                  height: 56,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      bool validate =
                                          _formKey.currentState!.validate();
                                      if (validate) {
                                        var data = {
                                          "email": _emailController.text,
                                          "password": _passwordController.text,
                                          "device_token": _deviceToken
                                        };
                                        setState(() {
                                          isLoading = true;
                                        });
                                        // CustomProgressDialog(context)
                                        //     .startLoadingDialog("Login.....!");
                                        Map<String, dynamic> result =
                                            await Provider.of<
                                                        UserManagementProvider>(
                                                    context,
                                                    listen: false)
                                                .userLogin(context, data);
                                        print("result : $result");
                                        if (result['status']) {
                                          print(
                                              "USET TYPE :: ${result['body']['user']['usertype']}");
                                          _emailController.clear();
                                          _passwordController.clear();

                                          ShowMToast(context).successToast(
                                              message: "Login success! 😀",
                                              alignment:
                                                  Alignment.bottomCenter);

                                          // SharedPreferencesManager().saveBool(
                                          //     AppConstants.isNotFirstLogin,
                                          //     true);
                                          // SharedPreferencesManager().saveBool(
                                          //     AppConstants.isLogin, true);

                                          setState(() {
                                            isLoading = false;
                                          });

                                          // bool hasDOB = await Provider.of<
                                          //             UserManagementProvider>(
                                          //         context,
                                          //         listen: false)

                                          if (result['body']['user']
                                                  ['usertype'] ==
                                              "PATIENT") {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PatientBottomNavigationBarMenu()));
                                          }
                                          if (result['body']['user']
                                                  ['usertype'] ==
                                              "HOSPITAL") {}

                                          if (result['body']['user']
                                                  ['usertype'] ==
                                              "DOCTOR") {}
                                          print(
                                              "user credential passed in my zeg0 ${result['body']['user']['id']}   ${result['body']['user']['username']}");
                                        } else {
                                          if (!result['status'] && result['exception']) {
                                            ShowMToast(context).errorToast(
                                                message: result['message'],
                                                alignment:
                                                    Alignment.bottomCenter);
                                            setState(() {
                                              isLoading = false;
                                            });
                                          }
                                          // if (result['exception']) {
                                          //   setState(() {
                                          //     isLoading = false;
                                          //   });
                                          //   ShowMToast(context).successToast(
                                          //       message: "Login Failed! ☹️",
                                          //       alignment:
                                          //           Alignment.bottomCenter);
                                          // } else {
                                          //   setState(() {
                                          //     isLoading = false;
                                          //   });
                                          //   ShowMToast(context).errorToast(
                                          //       message:
                                          //           "${result['body']['msg']}",
                                          //       alignment:
                                          //           Alignment.bottomCenter);
                                          //   print(result['body']);
                                          // }
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFFF92306)),
                                    child: const Text(
                                      'Sign In',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Are you a Doctor?',
                            style: TextStyle(
                              color: Color(0xFF837E93),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 2.5,
                          ),
                          InkWell(
                            onTap: () {},
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DoctorHospitalRegistrationScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign Up here',
                                style: TextStyle(
                                  color: Color(0xFFF92306),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Are you a Patient?',
                            style: TextStyle(
                              color: Color(0xFF837E93),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 2.5,
                          ),
                          InkWell(
                            onTap: () {},
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PatientRegistrationScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Sign Up here',
                                style: TextStyle(
                                  color: Color(0xFFF92306),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: Color(0xFF755DC1),
                          fontSize: 13,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
