
import 'package:flutter/material.dart';

import '../widgets/logoutbutton.dart';

class AdminProfile extends StatelessWidget {
  final String adminId;
  const AdminProfile({super.key, required this.adminId});

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
                          const Text("Admin",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
                          Text(adminId,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
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