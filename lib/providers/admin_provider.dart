
import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/models/colleges.dart';
import 'package:ipt_enrollement_systems/models/enrollment.dart';
import 'package:ipt_enrollement_systems/models/student.dart';

import '../models/admin.dart';
import '../models/subjects.dart';

class AdminProvider extends ChangeNotifier {
  int _totalUnits = 0;
  final List<Student> _user = [];
  final List<Admin> _admins = [];
  final List<College> _colleges = [];
  final List<Subject> _subjects = [];
   final List<Subject> _enrolledSubjects = [];

  final List<Enrollment> _enrollments = [];

  int get totalUnits => _totalUnits;
  List<Student> get user => _user;
  List<Admin> get admins => _admins;
  List<College> get colleges => _colleges;
  List<Subject> get subjects => _subjects;
   List<Subject> get enrolledSubjects => _enrolledSubjects;

  List<Enrollment> get enrollment => _enrollments;


  void enrolledSubjectsAdd(List<Subject> subjects) {
    
      _enrolledSubjects.addAll(subjects);
      notifyListeners();
  }

  void enrolledSubjectAdd(Subject subjects) {
    
      _enrolledSubjects.add(subjects);
      notifyListeners();
  }

  void setTotalUnits(int totalUnits) {
    _totalUnits = _totalUnits + totalUnits;
    notifyListeners();
  }

  void addStudent(Student student) {
  user.add(student);
  notifyListeners();
}
  void addAdmin(Admin admin) {
  _admins.add(admin);
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
void removeCollege(int index) {
  _colleges.removeAt(index);
  notifyListeners();
}

void addSubjects( List<Subject> subjects) {
  _subjects.addAll(subjects);
  notifyListeners();
}

void addSubject(Subject subjects) {
  _subjects.add(subjects);
  notifyListeners();
}

void removeSubject(int index) {
  _subjects.removeAt(index);
  notifyListeners();
}
void removeSubjects(String collegeTitle) {
  _subjects.removeWhere((subjects) => subjects.college_title.contains( collegeTitle));
  notifyListeners();
}

void addEnrollments( List<Enrollment> enrollments) {
  _enrollments.addAll(enrollments);
  notifyListeners();
}

 void logout(){
  _totalUnits = 0;
  _subjects.clear();
  _admins.clear();
  _enrollments.clear();
  _user.clear();
  _enrolledSubjects.clear();
  _colleges.clear();
  notifyListeners();
 }


    
  }

