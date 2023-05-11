import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/models/subjects.dart';
import 'package:ipt_enrollement_systems/widgets/subjectCard.dart';
import 'package:provider/provider.dart';
import '../../providers/admin_provider.dart';

class EnrooledSubjects extends StatelessWidget {
  final String userId;
  final bool isAdmin;
  final String dept;
  const EnrooledSubjects({Key? key, required this.dept, required this.isAdmin, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
    builder: (context, subjectProvider, child) {
       List<Subject> enrolledSubjects = subjectProvider.enrolledSubjects;
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: enrolledSubjects.map((subject) => SubjectCard(
            id: userId,
             index: enrolledSubjects.indexOf(subject),
                      isAdmin: isAdmin,
                      college_title: subject.college_title,
                      course_number: subject.course_number,
                      desc_title: subject.desc_title,
                      offerCode: subject.offerCode,
                      title: subject.title,
                      units: subject.units,
          )).toList(),
        ),
      );
    },
  );
  }
}