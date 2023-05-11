import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/Screens/login.dart';
import 'package:ipt_enrollement_systems/providers/admin_provider.dart';
import 'package:provider/provider.dart';

class LogoutButton extends StatelessWidget {
  

  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        
        onPressed: (){
          context.read<AdminProvider>().logout();
            Navigator.of(context).push(
                    MaterialPageRoute(builder: (contex) =>  const LoginScreen()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Logout',
          style: TextStyle(
            fontSize: 16,
            color:  Colors.amber
          ),
        ),
      ),
    );
  }
}
