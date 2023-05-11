

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Subject {
   final String? subjectAdminId;
  final String offerCode;
  final String title;
  final String college_title;
  final String course_number;
  final String desc_title;
  final int units;

  Subject({
     this.subjectAdminId,
    required this.offerCode,
    required this.title,
    required this.college_title,
    required this.course_number,
    required this.desc_title,
    required this.units,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      subjectAdminId: json['subject_adminID'] ?? '',
      offerCode: json['offerCode'],
      title: json['title'],
      college_title: json['college_title'],
      course_number: json['course_number'],
      desc_title: json['desc_title'],
      units: json['units'],
    );
  }

  Map<String, dynamic> toJson() => {
        'subject_adminID':  subjectAdminId,
        'offerCode': offerCode,
        'title': title,
        'college_title': college_title,
        'course_number': course_number,
        'desc_title': desc_title,
        'units': units,
      };
}





Future<List<Subject>> getAllSubjects() async {
  final response = await http.get(Uri.parse('http://localhost:8000/subjects'));
  
  if (response.statusCode == 200) {
    final List<dynamic> subjectsJson = jsonDecode(response.body);
    final List<Subject> subjects = subjectsJson.map((json) => Subject.fromJson(json)).toList();
    return subjects;
  } else {
    throw Exception('Failed to load subjects');
  }
}


Future<Subject?> createSubject(Subject subject, BuildContext context) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:8000/subjects/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(subject.toJson()),
    );
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Subject created successfully')));
      return Subject.fromJson(jsonDecode(response.body));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error creating subject: ${response.body}')));
      return null;
    }
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error creating subject: $error')));
    return null;
  }
}

Future<void> deleteSubjects( context, String offerCode) async {
  final url = Uri.parse('http://localhost:8000/subjects/$offerCode');

  final response = await http.delete(url);

  if (response.statusCode == 204) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Subject deleted successfully'),
        duration: Duration(seconds: 2),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Failed to delete subject'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

Future<List<Subject>> fetchSubjects(String studentId) async {
  final response = await http.get(
    Uri.parse('http://127.0.0.1:8000/students/$studentId/subjects/'),
  );

  if (response.statusCode == 200) {
    final subjectsJson = jsonDecode(response.body) as List;
    return subjectsJson.map((subjectJson) => Subject.fromJson(subjectJson)).toList();
  } else {
    throw Exception('Failed to fetch subjects');
  }
}