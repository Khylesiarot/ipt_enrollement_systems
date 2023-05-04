import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/models/colleges.dart';

import '../models/admin.dart';

class AdminProvider extends ChangeNotifier {
  late String _token;
  final List<Admin> _admins = [];
  final List<College> _colleges = [];

  List<Admin> get admins => _admins;
  List<College> get colleges => _colleges;

  String get token => _token;



  void addAdmin(Admin admin) {
  _admins.add(admin);
  notifyListeners();
}
  void setToken(String token) {
    _token = token;
    notifyListeners();
    
  }

void addColleges( List<College> colleges) {
  _colleges.addAll(colleges);
  notifyListeners();
}

void addCollege(College college) {
  _colleges.add(college);
  notifyListeners();
}


 


    
  }

