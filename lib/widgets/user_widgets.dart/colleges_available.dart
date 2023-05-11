import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/colleges.dart';
import '../../providers/admin_provider.dart';
import '../collegeCard.dart';

class CollegesAvlble extends StatelessWidget {
  final String id;
  final bool isAdmin;
  const CollegesAvlble({Key? key, required this.isAdmin, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
    builder: (context, collegeProvider, child) {
       List<College> colleges = collegeProvider.colleges;
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: colleges.map((college) => CollegeCard(
            id: id,
            isAdmin: isAdmin,
            index: colleges.indexOf(college),
            collegeId: college.collegeId!,
            title: college.title!,
            description: college.description!,
                 
          )).toList(),
        ),
      );
    },
  );
  }
}





