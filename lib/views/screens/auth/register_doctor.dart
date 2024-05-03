// ignore_for_file: prefer_const_constructors, unused_local_variable, use_build_context_synchronously, unused_field, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meet_your_doctor/constants/images.dart';
import 'package:meet_your_doctor/providers/user_management_provider.dart';
import 'package:meet_your_doctor/shared-functions/float_snackbar.dart';
// import 'package:meet_your_doctor/shared-functions/progress_dialog.dart';
import 'package:meet_your_doctor/shared-functions/snack_bar.dart';
// import 'package:meet_your_doctor/views/base/terms_privacy_page.dart';
import 'package:meet_your_doctor/views/screens/auth/login_user.dart';
import 'package:meet_your_doctor/views/screens/auth/register_hospital.dart';
import 'package:provider/provider.dart';






class DoctorHospitalRegistrationScreen extends StatefulWidget {
  const DoctorHospitalRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<DoctorHospitalRegistrationScreen> createState() =>
      _DoctorHospitalRegistrationScreenState();
}

class _DoctorHospitalRegistrationScreenState extends State<DoctorHospitalRegistrationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2),
            
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'Register Doctor'),
                Tab(text: 'Register Hospital'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  DoctorRegistrationScreen(),
                  HospitalRegistrationScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



































class DoctorRegistrationScreen extends StatefulWidget {
  const DoctorRegistrationScreen({super.key});

  @override
  State<DoctorRegistrationScreen> createState() =>
      _DoctorRegistrationScreenState();
}

class _DoctorRegistrationScreenState extends State<DoctorRegistrationScreen> {
  String? _selectedGender;
  String? _selectedSpecialization;

  DateTime? _selectedDateOfBirth;
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _passwordVisible = true;
  bool agree = false;
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }

  final _formKey = GlobalKey<FormState>();

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
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Image.asset(
                      fit: BoxFit.cover,
                      Images.logo,
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
                      const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 0, 0),
                          fontSize: 27,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // EMAIL
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
                        height: 17,
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
                          keyboardType: TextInputType.name,
                          controller: _nameController,
                          textAlign: TextAlign.start,
                          textCapitalization: TextCapitalization.words,
                          style: const TextStyle(
                            color: Color(0xFF393939),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                  color: Color(0xFFFF0404), fontSize: 12),
                              border: InputBorder.none),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 156,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFF92306),
                                    width: 1.2,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(16)),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              // obscureText: _passwordVisible,
                              controller: _firstnameController,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Color(0xFF393939),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: const InputDecoration(
                                  labelText: 'First Name',
                                  hintText: 'Enter name',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF837E93),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelStyle: TextStyle(
                                    color: Color(0xFFF92306),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none),
                            ),
                          ),
                          Container(
                            width: 156,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFF92306),
                                    width: 1.2,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(16)),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              // obscureText: _passwordVisible,
                              controller: _lastnameController,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Color(0xFF393939),
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: const InputDecoration(
                                  labelText: 'Last Name',
                                  hintText: 'enter name',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF837E93),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelStyle: TextStyle(
                                    color: Color(0xFFF92306),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
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
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: 'Phone',
                            labelStyle: TextStyle(
                                color: Color(0xFFFF0404), fontSize: 12),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
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
                          keyboardType: TextInputType.text,
                          controller: _codeController,
                          decoration: InputDecoration(
                            labelText: 'Hospital Code',
                            labelStyle: TextStyle(
                                color: Color(0xFFFF0404), fontSize: 12),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
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
                        child: DropdownButtonFormField<String>(
                          value: _selectedGender,
                          icon: const Icon(Icons.arrow_downward),
                          decoration: const InputDecoration(
                            labelText: 'Specialization',
                            labelStyle: TextStyle(
                              color: Color(0xFFF92306),
                              fontSize: 12,
                            ),
                            border: InputBorder.none,
                          ),
                          items: [
                            'Surgeon',
                            'Dentist',
                            'General',
                            'Gycanologist'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedSpecialization = newValue;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 156,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFF92306),
                                    width: 1.2,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(16)),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password is required";
                                }
                                if (value.length < 8) {
                                  return "Password should be at least 8 character";
                                }
                                if (value != _passwordController.text) {
                                  return "Please make sure both the password are the same";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              obscureText: _passwordVisible,
                              controller: _passwordController,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Color(0xFF393939),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: const InputDecoration(
                                  labelText: 'Password',
                                  hintText: 'Enter Password',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF837E93),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelStyle: TextStyle(
                                    color: Color(0xFFF92306),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none),
                            ),
                          ),
                          Container(
                            width: 156,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFF92306),
                                    width: 1.2,
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(16)),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Password is required";
                                }
                                if (value.length < 8) {
                                  return "Password should be at least 8 character";
                                }
                                if (value != _passwordController.text) {
                                  return "Please make sure both the password are the same";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              obscureText: _passwordVisible,
                              controller: _confirmPasswordController,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Color(0xFF393939),
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: const InputDecoration(
                                  labelText: 're-enter',
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF837E93),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  labelStyle: TextStyle(
                                    color: Color(0xFFF92306),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 25,
                      // ),
                      // CheckboxListTile(
                      //     value: agree,
                      //     onChanged: (value) {
                      //       agree = value!;
                      //     }),
                      const SizedBox(
                        height: 15,
                      ),
                      // ListTile(style: ListTileStyle.drawer,
                      //   leading: Checkbox(
                      //     value: agree,
                      //     onChanged: (bool? value) {
                      //       setState(() {
                      //         agree = value!;
                      //       });
                      //     },
                      //   ),
                      //   title: Text(
                      //     'I agree to the terms and conditions',
                      //     style: TextStyle(
                      //       // decoration: TextDecoration.underline,
                      //       // color: Colors.blue,
                      //     ),
                      //   ),
                      // ),
                      Row(
                        children: [
                          Checkbox(
                            value: agree,
                            onChanged: (value) {
                              setState(() {
                                agree = value!;
                              });
                            },
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: 'I agree to the ',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         TermsAndPrivacyPage(),
                                  //   ),
                                  // );
                                },
                              text: 'terms and conditions',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ]))
                        ],
                      ),
                      Center(
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: SizedBox(
                            width: 329,
                            height: 56,
                            child: ElevatedButton(
                              onPressed: () async {
                                bool validate =
                                    _formKey.currentState!.validate();
                             
                                  var data = {
                                    "email": _emailController.text,
                                    "password": _passwordController.text,
                                    "username": _nameController.text,
                                    "firstname": _firstnameController.text,
                                    "lastname": _lastnameController.text,
                                    "usertype": "DOCTOR",
                                    "hospital_code": _codeController.text,
                                    "specialization": _selectedSpecialization,
                                    // "phone": _phoneController.text,
                                    // "gender": _selectedGender!.toUpperCase()
                                  };
                                  print("DATA SENT : ${data}");
                                  Map<String, dynamic> result =
                                      await Provider.of<UserManagementProvider>(
                                              context,
                                              listen: false)
                                          .doctorRegister(context, data);
                                  if (result["status"]) {
                                    _emailController.clear();
                                    _passwordController.clear();
                                    _confirmPasswordController.clear();
                                    _firstnameController.clear();
                                    _lastnameController.clear();
                                    _codeController.clear();
                                    // SnackBars(ctx: context).successSnackBar(
                                    //     "Registered Successful! 😀");
                                    ShowMToast(context).successToast(
                                        message: "Registered Successful! 😀",
                                        alignment: Alignment.bottomCenter);

                                    Navigator.pop(context);
                                  } else {
                                  //   if (result["body"]["errors"]["email"] !=
                                  //       null) {
                                  //     ShowMToast(context).errorToast(
                                  //         message:
                                  //             "${result["body"]["errors"]["email"]} ☹️",
                                  //         alignment: Alignment.bottomCenter);
                                  //   } else if (result["body"]["errors"]
                                  //           ["phone"] !=
                                  //       null) {
                                  //     ShowMToast(context).errorToast(
                                  //         message:
                                  //             "${result["body"]["errors"]["phone"]} ☹️",
                                  //         alignment: Alignment.bottomCenter);
                                  //   } else {
                                  //     ShowMToast(context).errorToast(
                                  //         message:
                                  //             "${result["body"]["errors"]} ☹️",
                                  //         alignment: Alignment.bottomCenter);
                                  //   }
                                  // }
                                  
                                }},
                                  
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: const Text(
                                'Create account',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Do you have an account?',
                            textAlign: TextAlign.center,
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            },
                            child: const Text(
                              'Log In ',
                              style: TextStyle(
                                color: Color(0xFFF92306),
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
