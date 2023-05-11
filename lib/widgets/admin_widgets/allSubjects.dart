import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/models/subjects.dart';
import 'package:provider/provider.dart';

import '../../providers/admin_provider.dart';
import '../subjectCard.dart';

class AllSubjects extends StatelessWidget {
  final bool isAdmin;
  final String adminId;
   final String collegeTitle;
 


  const AllSubjects({Key? key, required this.adminId, required this.collegeTitle, required this.isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, subjectProvider, child) {
       List<Subject> subjects = subjectProvider.subjects
                    .where((subject) =>
                        subject.college_title.contains(collegeTitle))
                    .toList();
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: subjects
                .map((subject) => SubjectCard(
                  id: adminId,
                      index: subjects.indexOf(subject),
                      isAdmin: isAdmin,
                      college_title: subject.college_title,
                      course_number: subject.course_number,
                      desc_title: subject.desc_title,
                      offerCode: subject.offerCode,
                      title: subject.title,
                      units: subject.units,
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
