import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/Screens/register.dart';


import 'package:http/http.dart' as http;
import 'package:ipt_enrollement_systems/models/admin.dart';
import 'package:ipt_enrollement_systems/models/colleges.dart';
import 'package:ipt_enrollement_systems/providers/admin_provider.dart';
import 'package:provider/provider.dart';

import 'admin_homepage.dart';

String token = "";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _username;
  late final TextEditingController _password;

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
              onPressed: () async {
              
              token = await login(_username.text, _password.text, context);
           
             print(token);
             print('Token bytes: ${token.codeUnits}');

              if (token == '"UWU"') {
                  final admin = await getAdmin(_username.text);
                  context.read<AdminProvider>().addAdmin(admin);
                 
                final List<College> colleges =  await fetchColleges();
                context.read<AdminProvider>().addColleges(colleges);

                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (contex) => const AdminHomepage()));
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


  Future<String> login(String username, String password, BuildContext context) async {
  final url = Uri.parse('http://127.0.0.1:8000/login/');
  
  final response = await http.post(
    url,


    
    body: {
      'username': username,
      'password': password,
    },
  );
  
  if (response.statusCode == 200) {
    final tokenBytes = response.bodyBytes;
    final token = String.fromCharCodes(tokenBytes);
    if(token != '"UWU"' && token != '"AWA"') {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(token))
    );}
    return token;
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Failed to login'))
    );
    throw Exception('Failed to login');
  }
}
}
