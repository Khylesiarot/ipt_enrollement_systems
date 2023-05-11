
import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/providers/admin_provider.dart';

import '../widgets/logoutbutton.dart';

class UserProfile extends StatelessWidget {
  final AdminProvider user;
  const UserProfile({super.key, required this.user});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0 , vertical: 10),
            child: Align( alignment: Alignment.centerLeft,
              child: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_rounded, size: 40, color: Colors.white,))),
          ),
          const SizedBox(height: 50,),
           Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.white54,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 70,
                            ),
                          )),
                           const SizedBox(height: 15,),
                           Text("${user.user[0].firstName} ${user.user[0].lastName}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
                          Text(user.user[0].studentId ,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),),
                          Text("${user.user[0].college} ${user.user[0].degreeProgram}-${user.user[0].yearLevel}",style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey),),
                          const SizedBox(height: 25,),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0),
                            child: LogoutButton(),
                          )
        ],
      ),
    );
  }
}