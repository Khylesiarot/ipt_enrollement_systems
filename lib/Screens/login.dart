// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/Screens/homepage.dart';
import 'package:ipt_enrollement_systems/Screens/register.dart';


import 'package:http/http.dart' as http;
import 'package:ipt_enrollement_systems/models/admin.dart';
import 'package:ipt_enrollement_systems/models/colleges.dart';
import 'package:ipt_enrollement_systems/models/enrollment.dart';
import 'package:ipt_enrollement_systems/models/student.dart';
import 'package:ipt_enrollement_systems/models/subjects.dart';
import 'package:ipt_enrollement_systems/providers/admin_provider.dart';
import 'package:provider/provider.dart';

import 'admin_homepage.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late final TextEditingController _username;
  late final TextEditingController _password;
  bool? isAdminl;
  @override
  void initState() {
    _username = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      backgroundColor: const Color.fromARGB(148, 217, 222, 235),
      

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 250,
              width: 250,
              child: Image(
                image: NetworkImage(
                    'https://i.ibb.co/2cLHm09/Artistic-Textured-Ink-Brush-Stroke-Brand-Logo-1.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _username,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.white)),
                labelText: 'Username',
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _password,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                labelText: 'Password',
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MaterialButton(
              onPressed: ()  async{
              
               isAdminl = await login(_username.text, _password.text);
           
          

              if (isAdminl == true) {
                final admin = await getAdmin(_username.text);
                context.read<AdminProvider>().addAdmin(admin);
                 
                final List<College> colleges =  await fetchColleges();
                context.read<AdminProvider>().addColleges(colleges);

                final List<Subject> subjects = await getAllSubjects();
                 context.read<AdminProvider>().addSubjects(subjects);

                final List<Enrollment> enrollmentlistss = await getEnrollments();
                 context.read<AdminProvider>().addEnrollments(enrollmentlistss);
                 
                 
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (contex) =>  AdminHomepage(isAdmin: isAdminl!,)));
              }
              else if( isAdminl ==false ){
                final user = await getStudent(_username.text);
                context.read<AdminProvider>().addStudent(user);
                 
                final List<College> colleges =  await fetchColleges();
                context.read<AdminProvider>().addColleges(colleges);

                final List<Subject> subjects = await getAllSubjects();
                 context.read<AdminProvider>().addSubjects(subjects);

                 final List<Subject> subjectsEnrolled = await fetchSubjects(_username.text);
                  context.read<AdminProvider>().enrolledSubjectsAdd(subjectsEnrolled);

                final int totalUnits  = await getTotalUnits(_username.text);
                  context.read<AdminProvider>().setTotalUnits(totalUnits);
                  
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (contex) =>  Homepage(isAdmin: isAdminl!,)));

              }

              },
              minWidth: double.infinity,
              height: 60,
              color: Colors.blue[500],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (contex) => const RegisterScreen()));
              },
              minWidth: double.infinity,
              height: 60,
              color: Colors.black87,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                'Register',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }


 


  Future<bool?> login(String username, String password) async {
    final url = Uri.parse('http://127.0.0.1:8000/login/');
    final response = await http.post(url, body: {
    'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final token = responseData['token'];

      if (token.startsWith('A-')) {
             return true;

      } else if (token.startsWith('S-')) {
        return false;
      }
    } else {
       ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Failed to login')));
      return null;
    }
    return null;
  }}

