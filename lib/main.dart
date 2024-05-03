import 'package:flutter/material.dart';
import 'package:meet_your_doctor/providers/default_provider.dart';
import 'package:meet_your_doctor/providers/hospital_management.dart';
import 'package:meet_your_doctor/providers/user_management_provider.dart';
import 'package:meet_your_doctor/views/base/splash_screen.dart';
import 'package:meet_your_doctor/views/screens/auth/login_user.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DefaultProvider()),
        ChangeNotifierProvider(create: (context) => UserManagementProvider()),
        ChangeNotifierProvider(create: (context) => HospitalManagementProvider()),


      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SplashScreen(),
      home: LoginScreen(),
    );
  }
}
