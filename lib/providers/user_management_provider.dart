import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meet_your_doctor/constants/app_constants.dart';
import 'package:meet_your_doctor/helpers/api/api_client_http.dart';
import 'package:meet_your_doctor/shared-preference-manager/preference-manager.dart';

class UserManagementProvider extends ChangeNotifier {
  var _user;
  var _userAccount;

  get user => _user;
  get userAccount => _userAccount;

  Future<Map<String, dynamic>> userLogin(ctx, data) async {
    try {
      var res = await ApiClientHttp(
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      ).postRequest(AppConstants.loginUrl, data);

      if (res == null) {
        return res;
      } else {
        var body = res;
        if (body['login']) {
          var sharedPref = SharedPreferencesManager();
          sharedPref.init();
          // sharedPref.saveString(AppConstants.user, jsonEncode(body['user']));
          // sharedPref.saveString(AppConstants.token, json.encode(body['token']));
          print("BODY :: ${body}");

          return {"status": true, "body": body};
        }
        // notifyListeners();

        return body;
      }
    } catch (e) {
      return {"status": false, "exception": true, "message": e.toString()};
    }
  }

  Future<Map<String, dynamic>> patientRegister(ctx, data) async {
    try {
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-type': 'application/json',
      }).postRequest(AppConstants.registerUrl, data);

      if (res == null) {
        return {"status": "No response"};
      } else {
        var body = res;

        if (body['save']) {
          return {"status": true, "data": body};
        }
        // notifyListeners();
        return {"status": false, "body": body, "exception": false};
      }
    } catch (e) {
      return {"status": false, "exception": true};
    }
  }

  Future<Map<String, dynamic>> doctorRegister(ctx, data) async {
    try {
      print(AppConstants.apiBaseUrl + AppConstants.registerUrl);
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-type': 'application/json',
      }).postRequest(AppConstants.registerUrl, data);
      print("RES :: ${res}");

      if (res == null) {
        print("BODY :: ${res}");

        return {"status": "No response"};
      } else {
        var body = res;
        print("BODY :: ${body}");
        if (body['save']) {
          return {"status": true, "data": body};
        }
        // notifyListeners();
        print("BODY :: ${body}");

        return {"status": false, "body": body, "exception": false};
      }
    } catch (e) {
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      print(e);
      return {"status": false, "exception": true};
    }
  }

  Future<Map<String, dynamic>> hospitalRegister(ctx, data) async {
    try {
      print(AppConstants.apiBaseUrl + AppConstants.registerUrl);
      var res = await ApiClientHttp(headers: <String, String>{
        'Content-type': 'application/json',
      }).postRequest(AppConstants.registerUrl, data);
      print("RES :: ${res}");

      if (res == null) {
        print("BODY :: ${res}");

        return {"status": "No response"};
      } else {
        var body = res;
        print("BODY :: ${body}");
        if (body['save']) {
          return {"status": true, "data": body};
        }
        // notifyListeners();
        print("BODY :: ${body}");

        return {"status": false, "body": body, "exception": false};
      }
    } catch (e) {
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxx");
      print(e);
      return {"status": false, "exception": true};
    }
  }
}
