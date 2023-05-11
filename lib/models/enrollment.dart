// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

class Enrollment {
  String enrollment_id;
  String student_id;
  String offer_code;
  DateTime date_enrolled;

  Enrollment({
    required this.enrollment_id,
    required this.student_id,
    required this.offer_code,
    required this.date_enrolled,
  });

  factory Enrollment.fromJson(Map<String, dynamic> json) {
    return Enrollment(
      enrollment_id: json['enrollment_id'],
      student_id: json['student_id'],
      offer_code: json['offer_code'],
      date_enrolled: DateTime.parse(json['date_enrolled']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enrollment_id': enrollment_id,
      'student_id': student_id,
      'offer_code': offer_code,
      'date_enrolled': date_enrolled.toIso8601String(),
    };
  }
}

Future<List<Enrollment>> getEnrollments() async {
    final response = await http.get(Uri.parse(
        'http://localhost:8000/enrollment/'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<Enrollment> enrollments = data.map((json) {
        return Enrollment.fromJson(json);
      }).toList();
      return enrollments;
    } else {
      throw Exception('Failed to load enrollments');
    }
  }


  Future<bool> createEnrollment(String student_id, String offer_code, String id) async {
  const apiUrl = 'http://127.0.0.1:8000/enrollment/'; 
  final headers = {'Content-Type': 'application/json'};
  final enrollmentData = Enrollment(
    enrollment_id: id, 
    student_id: student_id,
    offer_code: offer_code,
     date_enrolled: DateTime.now(),
  );
  final jsonData = json.encode(enrollmentData.toJson());

  final response = await http.post(Uri.parse(apiUrl), headers: headers, body: jsonData);

  if (response.statusCode == 201) {
    // enrollment created successfully
    final enrollment = Enrollment.fromJson(json.decode(response.body));
    print('Enrollment created: ${enrollment.enrollment_id}, ${enrollment.student_id}, ${enrollment.offer_code}');
    return true;
  } else {
    // error creating enrollment
    print('Error creating enrollment: ${response.statusCode}');
   return false;
  }
}


Future<int> getTotalUnits(String student_id)async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/students/$student_id/units/'));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return jsonResponse['total_units'];
  } else {
    throw Exception('Failed to load total units');
  }
}