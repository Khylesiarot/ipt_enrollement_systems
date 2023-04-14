import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/Screens/register.dart';

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
    _password =TextEditingController();
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
      backgroundColor: Color.fromARGB(148, 217, 222, 235),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           const Padding(
             padding: EdgeInsets.symmetric(horizontal:20.0),
             child: SizedBox(
              height: 250,
              width: 250,
              child: Image(image: NetworkImage('https://i.ibb.co/2cLHm09/Artistic-Textured-Ink-Brush-Stroke-Brand-Logo-1.png'),
              fit: BoxFit.contain,),
                     ),
           ),
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Container(
              alignment: Alignment.center,
              child:  const Text('LOGIN',
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w900,
              fontSize: 30,
  
            ),),
            ),
          ),
           const SizedBox(height: 30,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal:20.0),
             child: TextField(
              controller: _username,
              
              decoration:  InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                   borderSide: BorderSide(color: Colors.white)
                ),
                labelText: 'Username',
                
                focusedBorder: OutlineInputBorder(
                 
                  borderSide: BorderSide(color: Colors.white, width: 2),
                   borderRadius: BorderRadius.circular(15)
                ),
              ),
                     ),
           ),
          const SizedBox(height: 15),
        
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: TextField(
              controller: _password,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              decoration:  InputDecoration(
                filled: true,
                fillColor: Colors.white,
                
                enabledBorder: OutlineInputBorder(
                 
                  borderSide: BorderSide(color: Colors.white, width: 2),
                   borderRadius: BorderRadius.circular(15)
                ),
                labelText: 'Password',

                focusedBorder: OutlineInputBorder(
                 
                  borderSide: BorderSide(color: Colors.white, width: 2),
                   borderRadius: BorderRadius.circular(15)
                ),
              ),
              
            ),
          ),


           const SizedBox(height: 30,),

           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20.0),
             child: MaterialButton(onPressed: (){},
             minWidth: double.infinity,
             height: 60,
             color: Colors.blue[500],
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
             ), 
             child: Text('Login',
             style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
             ),),),
           ),
const SizedBox(height: 15,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20.0),
             child: MaterialButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (contex) => RegisterScreen()));
             },
             minWidth: double.infinity,
             height: 60,
             color: Colors.black87,
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
             ), 
             child: Text('Register',
             style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
             ),),),
           )
        ],
      ),
    );
  }
}