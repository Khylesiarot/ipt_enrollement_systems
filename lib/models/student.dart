// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Student {
  String studentId;
  String password;
  String degreeProgram;
  String firstName;
  String lastName;
  String college;
  int yearLevel;

  Student({
    required this.studentId,
    required this.password,
    required this.degreeProgram,
    required this.firstName,
    required this.lastName,
    required this.college,
    required this.yearLevel,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        studentId: json['studentId'],
        password: json['password'],
        degreeProgram: json['degree_program'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        college: json['college'],
        yearLevel: json['year_lvl'],
      );

  Map<String, dynamic> toJson() => {
        'studentId': studentId,
        'password': password,
        'degree_program': degreeProgram,
        'first_name': firstName,
        'last_name': lastName,
        'college': college,
        'year_lvl': yearLevel,
      };
}

Future<Student?> createStudent(Student student, BuildContext context) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:8000/students/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(student.toJson()),
    );
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Student created successfully')));
      return Student.fromJson(jsonDecode(response.body));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error creating student: ${response.body}')));
      return null;
    }
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating student: $error')));
    return null;
  }
}

Future<Student> getStudent(String studentId) async {
  final response = await http.get(Uri.parse('http://localhost:8000/students/$studentId'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final student = Student.fromJson(data);
    return student;
  } else {
    throw Exception('Failed to load student');
  }
}