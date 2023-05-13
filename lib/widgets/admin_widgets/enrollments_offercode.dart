import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/models/enrollment.dart';
import 'package:ipt_enrollement_systems/models/subjects.dart';
import 'package:ipt_enrollement_systems/widgets/enrollmentCard.dart';
import 'package:provider/provider.dart';

import '../../providers/admin_provider.dart';
import '../subjectCard.dart';

class EnrollmentLists extends StatelessWidget {
  final String offerCode;
   final String title;
   final String description;
 


  const EnrollmentLists({Key? key, required this.offerCode, required this.title, required this.description, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, enrollmentProvider, child) {
       List<Enrollment> enrollment = enrollmentProvider.enrollment
                    .where((e) =>
                        e.offer_code.contains(offerCode))
                    .toList();
        return enrollment.isEmpty ? const Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 20),
          child: Text("NO ENROLLEES", style: TextStyle(
            fontSize: 30,
            color: Colors.grey,
            fontWeight: FontWeight.bold
          ),),
        ) : SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: enrollment
                .map((e) => EnrollmentCard(
                     enrollmentId: e.enrollment_id,
                      offerCode: e.offer_code,
                      studentId: e.student_id,
                      dateEnrolled: e.date_enrolled,
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
