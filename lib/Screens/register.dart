import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
      backgroundColor: const Color.fromARGB(148, 217, 222, 235),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           
          const SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child:  const Text('Register',
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w900,
              fontSize: 30,
  
            ),),
            ),
          ),
           const SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal:15.0),
             child: TextField(
              controller: _username,
              
              decoration:  InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.white)
                ),
                labelText: 'Firstname',
                
                focusedBorder: OutlineInputBorder(
                 
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                   borderRadius: BorderRadius.circular(15)
                ),
              ),
                     ),
           ),
          const SizedBox(height: 10),
        
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0),
            child: TextField(
              controller: _password,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              decoration:  InputDecoration(
                filled: true,
                fillColor: Colors.white,
                
                enabledBorder: OutlineInputBorder(
                 
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                   borderRadius: BorderRadius.circular(10)
                ),
                labelText: 'Lastname',

                focusedBorder: OutlineInputBorder(
                 
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                   borderRadius: BorderRadius.circular(15)
                ),
              ),
              
            ),
          ),
 const SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal:15.0),
             child: TextField(
              controller: _username,
              
              decoration:  InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.white)
                ),
                labelText: 'Student ID',
                
                focusedBorder: OutlineInputBorder(
                 
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                   borderRadius: BorderRadius.circular(15)
                ),
              ),
                     ),
           ),
            const SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal:15.0),
             child: TextField(
              controller: _username,
              
              decoration:  InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                   borderSide: const BorderSide(color: Colors.white)
                ),
                labelText: 'Degree Program',
                
                focusedBorder: OutlineInputBorder(
                 
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                   borderRadius: BorderRadius.circular(15)
                ),
              ),
                     ),
           ),
const SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20.0),
             child: Row(
              children: [
                Expanded(child: 
                TextField(
                controller: _username,
                
                decoration:  InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                     borderSide: const BorderSide(color: Colors.white)
                  ),
                  labelText: 'College',
                  
                  focusedBorder: OutlineInputBorder(
                   
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                     borderRadius: BorderRadius.circular(15)
                  ),
                ),
                       ),
                       ),

                       const SizedBox(width: 5,),

                       Expanded(child: 
                       TextField(
                controller: _username,
                
                decoration:  InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                     borderSide: const BorderSide(color: Colors.white)
                  ),
                  labelText: 'Year Level',
                  
                  focusedBorder: OutlineInputBorder(
                   
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                     borderRadius: BorderRadius.circular(15)
                  ),
                ),
                       ),)
              ],
             ),
           ),

           
const SizedBox(height: 15,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 15.0),
             child: MaterialButton(onPressed: (){},
             minWidth: double.infinity,
             height: 60,
             color: Colors.black87,
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
             ), 
             child: const Text('Register',
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