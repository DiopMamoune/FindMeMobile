// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter_login_register/models/user.dart';
import 'package:flutter_login_register/utils/network_util.dart';
// ignore: unused_import
import 'package:flutter_login_register/exception/login_exception.dart';
// ignore: unused_import
import 'package:flutter_login_register/data/database_helper.dart';
// ignore: duplicate_import
import 'package:flutter_login_register/models/user.dart';

class RestData {
  // ignore: unused_field
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";
  //You can use this to login into a web service We are still working on it

  Future<User> login(String username, String password) {
    //expected success from web service
    return new Future.value(new User(username, password));
  }

  Future<User> register(String username, String password) {
    //expected success from web service
    return new Future.value(new User(username, password));
  }
}
