// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meet_your_doctor/providers/hospital_management.dart';
import 'package:meet_your_doctor/views/screens/home/patient_home/constants.dart';
import 'package:meet_your_doctor/views/screens/home/patient_home/gridview.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HospitalManagementProvider>(context, listen: false)
        .fetchAllHospital();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount:
                Provider.of<HospitalManagementProvider>(context, listen: true)
                    .allHospitals
                    .length,
            itemBuilder: (context, index) {
              print(
                  Provider.of<HospitalManagementProvider>(context, listen: true)
                      .allHospitals
                      .length);
              var hospitals =
                  Provider.of<HospitalManagementProvider>(context, listen: true)
                      .allHospitals;
              var hospital = hospitals[index];
              print("hospital : ${hospital['hospital_name']}");
              return ListTile(
                title: hospital['hospital_name'],
              );
            }));
  }

  Widget buildService(String title, String image) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            Container(
              height: 70,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                image: DecorationImage(
                    image: AssetImage('assets/$image'), fit: BoxFit.fill),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                color: Color(0xFFFFFFFF),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
