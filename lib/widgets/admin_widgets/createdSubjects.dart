import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/models/subjects.dart';
import 'package:ipt_enrollement_systems/widgets/subjectCard.dart';
import 'package:provider/provider.dart';
import '../../providers/admin_provider.dart';

class CreateSubjects extends StatelessWidget {
  final bool isAdmin;
  final String adminId;
  const CreateSubjects({Key? key, required this.adminId, required this.isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
    builder: (context, subjectProvider, child) {
       List<Subject> subjects = subjectProvider.subjects.where(
      (subject) => subject.subjectAdminId == adminId
    ).toList();
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: subjects.map((subject) => SubjectCard(
            id: adminId,
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