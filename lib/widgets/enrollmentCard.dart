// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/widgets/admin_widgets/student_details.dart';

import '../models/student.dart';


class EnrollmentCard extends StatelessWidget {


  final String enrollmentId;
  final String studentId;
  final String offerCode;
  final DateTime dateEnrolled;

  const EnrollmentCard({
    Key? key,
   
    required this.enrollmentId,
    required this.studentId,
    required this.offerCode,
    required this.dateEnrolled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        Student student = await getStudent(studentId);

        showDialog(
              context: context,
              builder: (context) =>  StudentDetailsCard(student: student,),
              barrierDismissible: false,
            );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Expanded(
          child: Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              
                  children: [
                    Text(
                      studentId,
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                        dateEnrolled.toIso8601String(),
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
