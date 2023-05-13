import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/colleges.dart';
import '../../providers/admin_provider.dart';
import '../collegeCard.dart';

class AllColleges extends StatelessWidget {

  final bool isAdmin;
  final String id;

  const AllColleges({Key? key, required this.id, required this.isAdmin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AdminProvider>(
      builder: (context, collegeProvider, child) {
        List<College> colleges = collegeProvider.colleges;
        return colleges.isEmpty ? const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text("ADD COLLEGE", style: TextStyle(
            fontSize: 30,
            color: Colors.grey,
            fontWeight: FontWeight.bold
          ),),
        ) :  GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          children: colleges
              .map(
                (college) => Expanded(
                  child: CollegeCard(
                    id: id,
                    isAdmin: isAdmin,
                    index: colleges.indexOf(college),
                    collegeId: college.collegeId!,
                    title: college.title!,
                    description: college.description!,
                  
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
