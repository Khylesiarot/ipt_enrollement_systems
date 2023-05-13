import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/colleges.dart';
import '../../providers/admin_provider.dart';
import '../collegeCard.dart';

class CreateColleges extends StatelessWidget {
  final bool isAdmin;
  final String adminId;
  const CreateColleges({Key? key, required this.adminId, required this.isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
    builder: (context, collegeProvider, child) {
       List<College> colleges = collegeProvider.colleges.where(
      (college) => college.collegeAdminId == adminId
    ).toList();
      return colleges.isEmpty ? const Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 20),
          child: Text("EMPTY", style: TextStyle(
            fontSize: 30,
            color: Colors.grey,
            fontWeight: FontWeight.bold
          ),),
        ) : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: colleges.map((college) => CollegeCard(
            id: adminId,
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