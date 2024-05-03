// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:meet_your_doctor/constants/app_colors.dart';
import 'package:meet_your_doctor/views/screens/home/patient_home/home.dart';

class PatientBottomNavigationBarMenu extends StatefulWidget {
  const PatientBottomNavigationBarMenu({super.key});

  @override
  State<PatientBottomNavigationBarMenu> createState() =>
      _PatientBottomNavigationBarMenuState();
}

class _PatientBottomNavigationBarMenuState extends State<PatientBottomNavigationBarMenu>
    with TickerProviderStateMixin {
  int _currentPage = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children:  [
          HomeScreen(),

          Center(child: Text("1")),
          Center(child: Text("2")),
          // Center(child: Text("3")),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: const <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: AppColors.primaryColor,
          ),
          BottomBarItem(
            icon: Icon(Icons.star),
            title: Text('Appointments'),
            activeColor: AppColors.primaryColor,
          ),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            backgroundColorOpacity: 0.1,
            activeColor: AppColors.primaryColor,
          )
        ],
      ),
    );
  }
}
