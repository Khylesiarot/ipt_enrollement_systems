// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/models/enrollment.dart';
import 'package:ipt_enrollement_systems/providers/admin_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../Screens/admin_enrollment.dart';
import '../models/subjects.dart';

class SubjectCard extends StatelessWidget {
  

  final int index;
  final String id;
  final bool isAdmin;
  final String offerCode;
  final String title;
  final String college_title;
  final String course_number;
  final String desc_title;
  final int units;

  const SubjectCard(
      {Key? key,
      required this.title,
      required this.offerCode,
      required this.index,
   
      required this.college_title,
      required this.course_number,
      required this.desc_title,
      required this.units, required this.isAdmin, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<AdminProvider>();
    final int totalUnits = userProvider.totalUnits;
    const uuid = Uuid();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          if (isAdmin) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (contex) => EnrollmentListsPage(
                    offerCode: offerCode,
                    title: title,
                    description: desc_title,
                  )));
        }},
        child: Expanded(
          child: Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              offerCode,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '$college_title - $title',
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              desc_title,
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: isAdmin ? IconButton(
                    onPressed: () {
                      deleteSubjects(context, offerCode);
                      context.read<AdminProvider>().removeSubject(index);
                    },
                    icon:
                        const Icon(Icons.delete, color: Colors.amber, size: 20),
                  ): IconButton(
                    onPressed: () async {
                            if(totalUnits + units <= 24){
                            final en_id = uuid.v4();
                            bool isSuc = await createEnrollment(id, offerCode, en_id);

                            if(isSuc){Subject enrolledSubjects = Subject(college_title: college_title, course_number: course_number, units: units, desc_title: desc_title, title: title, offerCode: offerCode);



                               context.read<AdminProvider>().enrolledSubjectAdd(enrolledSubjects);

                         
                              context.read<AdminProvider>().setTotalUnits(units);
                            }
                            }
                            else{
                               ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Enroll 24 units only!')));
                            }
                         
                    },
                    icon:
                        const Icon(Icons.playlist_add_check_rounded, color: Colors.green, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
