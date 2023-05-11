import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/widgets/admin_widgets/allSubjects.dart';
import 'package:provider/provider.dart';

import '../providers/admin_provider.dart';
import '../widgets/subjectRegister.dart';

class SubjectPage extends StatelessWidget {
  final String id;
    final bool isAdmin;
   final String collegeTitle;
  final String description;

  const SubjectPage({Key? key, required this.collegeTitle, required this.description, required this.isAdmin, required this.id, }) : super(key: key);

  @override
   Widget build(BuildContext context) {
  
   

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 247, 250),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: appBar(context),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Subjects",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.start,
                      )),
                ),
                SizedBox(child: AllSubjects(adminId: id, collegeTitle: collegeTitle, isAdmin: isAdmin,)),
              
              ],
            )),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10.0, bottom: 10),
        child: ClipOval(
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
              context: context,
              builder: (context) =>  SujectRegistrationForm(collegetitle: collegeTitle, adminId: id,),
              barrierDismissible: false,
            );
            },
            backgroundColor: Colors.amber ,
            child: const Icon(Icons.add),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
     
    );
  }

  Widget appBar(context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: 140,
      child: Row(
        children: [
         const SizedBox(
            width: 20,
                   ),
           
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const SizedBox(
                height: 65,
              ),
              Row(
                
           
                children: [
                  SizedBox(
         
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.amber,size: 15,)),
                   ),
                  Text(
                    collegeTitle,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                ],
              ),
              Text(description,
                  style: const TextStyle(fontSize: 15, color: Colors.black)),
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: Container(
              color: Colors.amber,
              height: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Colors.white54,
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 40,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
