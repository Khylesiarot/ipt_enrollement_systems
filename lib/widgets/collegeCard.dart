import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/providers/admin_provider.dart';
import 'package:provider/provider.dart';

import '../Screens/admin_subjectpage.dart';

import '../models/colleges.dart';

class CollegeCard extends StatelessWidget {
  final String id;
  final bool isAdmin;
  final int index;
  final String collegeId;
  final String title;
  final String description;


  const CollegeCard({
    Key? key,
    required this.title,
    required this.description,
    required this.collegeId,
    required this.index, required this.isAdmin, required this.id, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
                    MaterialPageRoute(builder: (contex) =>  SubjectPage(id: id,collegeTitle: title, description: description,isAdmin: isAdmin,)));
        },
        child: Container(
          height: 170,
          width: 140,
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: isAdmin ? IconButton(
                  onPressed: () {
                    deleteCollege(context, collegeId);
                      context.read<AdminProvider>().removeSubjects(title);
                    context.read<AdminProvider>().removeCollege(index);

                    
                  

                  },
                  icon: const Icon(Icons.delete, color: Colors.amber, size: 20),
                ): null
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        description,
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
