import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/models/enrollment.dart';
import 'package:ipt_enrollement_systems/models/subjects.dart';
import 'package:ipt_enrollement_systems/widgets/subjectCard.dart';
import 'package:provider/provider.dart';
import '../../providers/admin_provider.dart';

class DeptSubjects extends StatelessWidget {
  final String userId;
  final bool isAdmin;
  final String dept;
  const DeptSubjects({Key? key, required this.dept, required this.isAdmin, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
    builder: (context, subjectProvider, child) {
   List<Subject> enrollment = subjectProvider.enrolledSubjects;
List<Subject> subjects = subjectProvider.subjects.where((subject) {
  return subject.college_title == dept &&
      !enrollment.any((enrolledSubject) => enrolledSubject.offerCode == subject.offerCode);
}).toList();
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: subjects.map((subject) => SubjectCard(
            id: userId,
             index: subjects.indexOf(subject),
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