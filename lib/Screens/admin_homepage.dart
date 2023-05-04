import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/colleges.dart';
import '../providers/admin_provider.dart';
import '../widgets/collegeRegistration.dart';


class AdminHomepage extends StatelessWidget {
  const AdminHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final adminProvider = context.watch<AdminProvider>();
    final admins = adminProvider.admins;
    final adminId = admins[0].adminId;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text("ADMIN"),
            Text(adminId),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextButton(child: Text("add College"), onPressed: (){

               showDialog(context: context, builder: (context) =>
            const CollegeRegistrationForm(),
            barrierDismissible: false,
          );
            },),
            Consumer<AdminProvider>(
              builder: (context, collegeProvider, child) {
                List<College> colleges = collegeProvider.colleges;
                return Expanded(
                  child: ListView.builder(
                    itemCount: colleges.length,
                    itemBuilder: (context, index) {
                      College college = colleges[index];
                      return ListTile(
                        title: Text(college.title!),
                        subtitle: Text(college.description!),
            
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
