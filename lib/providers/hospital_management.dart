import 'package:flutter/material.dart';
import 'package:meet_your_doctor/constants/app_constants.dart';
import 'package:meet_your_doctor/helpers/api/api_client_http.dart';

class HospitalManagementProvider extends ChangeNotifier {
  var _hospital;
  get hospital => _hospital;

  List<Map<String, dynamic>> _allHospitals = [];

  List<Map<String, dynamic>> get allHospitals => _allHospitals;

  Future<void> fetchAllHospital() async {
    try {
      var res = await ApiClientHttp(
              headers: <String, String>{'Content-type': 'application/json'})
          .getRequest(AppConstants.getHospital);

      if (res == null) {
      } else {
        var body = res;
        print("BODY :: $body");
        _allHospitals = body['data'];
        // print("BODY :: ${List<Map<String,dynamic>>.from(body as Iterable)}");
      }
    } catch (e) {}
  }
}
