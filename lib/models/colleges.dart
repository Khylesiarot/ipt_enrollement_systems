import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class College {
  final String? collegeAdminId;
  final String? collegeId;
  final String? title;
  final String? description;

  College({
    this.collegeAdminId,
    this.collegeId,
    this.title,
    this.description,
  });

  factory College.fromJson(Map<String, dynamic> json) {
    return College(
      collegeAdminId: json['college_adminID'] ?? '',
      collegeId: json['collegeId'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'college_adminID':  collegeAdminId,
        'collegeId': collegeId,
        'title': title,
        'description': description,
      };
}



  Future<List<College>> fetchColleges() async {
  try {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/colleges/'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<College> colleges = jsonData.map((json) => College.fromJson(json)).toList();
      return colleges;
    } else {
      throw Exception('Failed to fetch colleges');
    }
  } catch (error) {
    rethrow;
  }
}


Future<College?> createCollege(College college, BuildContext context) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:8000/colleges/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(college.toJson()),
    );
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('College created successfully')));
      return College.fromJson(jsonDecode(response.body));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error creating college: ${response.body}')));
      return null;
    }
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating student: $error')));
    return null;
  }
}