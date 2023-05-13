import 'package:flutter/material.dart';

import '../../models/student.dart';

class StudentDetailsCard extends StatelessWidget {
  final Student student;
  const StudentDetailsCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:  Icon(Icons.cancel_rounded, color: Colors.red[900], size: 20),
              )),
          Text(
            '${student.firstName} ${student.lastName}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 8),
            Text(
            student.studentId,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
            Text(
            '${student.college} | ${student.degreeProgram} - ${student.yearLevel}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),

        ]));
  }
}
