import 'package:http/http.dart' as http;
import 'dart:convert';
class Admin {
  String adminId;
  String password;

  Admin({required this.adminId, required this.password});

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      adminId: json['adminId'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adminId'] = adminId;
    data['password'] = password;
    return data;
  }
}
Future<Admin> getAdmin(String adminId) async {
  final response = await http.get(Uri.parse('http://localhost:8000/admins/$adminId/'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final admin = Admin.fromJson(data);
    return admin;
  } else {
    throw Exception('Failed to load admin');
  }
}




