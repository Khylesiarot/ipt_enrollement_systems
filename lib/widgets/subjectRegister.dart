import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/models/subjects.dart';
import 'package:provider/provider.dart';

import '../providers/admin_provider.dart';

class SujectRegistrationForm extends StatefulWidget {
  final String collegetitle;
  final String adminId;

  const SujectRegistrationForm(
      {Key? key, required this.collegetitle, required this.adminId})
      : super(key: key);

  @override
  State<SujectRegistrationForm> createState() => _SujectRegistrationForm();
}

class _SujectRegistrationForm extends State<SujectRegistrationForm> {
  String dropDownvalue = "1";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "1", child: Text("1")),
      const DropdownMenuItem(value: "2", child: Text("2")),
      const DropdownMenuItem(value: "3", child: Text("3")),
    ];
    return menuItems;
  }

  final offerCode = TextEditingController();
  final title = TextEditingController();
  final courseNumber = TextEditingController();
  final descTitle = TextEditingController();
  final units = TextEditingController();

  @override
  void dispose() {
    offerCode.dispose();
    title.dispose();
    courseNumber.dispose();
    descTitle.dispose();
    units.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final adminProvider = context.watch<AdminProvider>();
    final admins = adminProvider.admins;
    final adminId = admins[0].adminId;

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add Subject',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: offerCode,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Input offer code',
              labelText: 'Offer Code',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: title,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Title',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: courseNumber,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Course Number',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: descTitle,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Description',
            ),
          ),
          Container(
            width: 100,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: DropdownButton(
                value: dropDownvalue,
                items: dropdownItems,
                onChanged: (newvalue) {
                  setState(() {
                    dropDownvalue = newvalue.toString();
                  });
                },
                style: const TextStyle(
                  color: Colors.black,
                ),
                dropdownColor: Colors.white,
                isExpanded: false,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    if (title.text.isNotEmpty &&
                        offerCode.text.isNotEmpty &&
                        courseNumber.text.isNotEmpty &&
                        descTitle.text.isNotEmpty) {
                      Subject registration = Subject(
                        subjectAdminId: widget.adminId,
                        offerCode: offerCode.text,
                        title: title.text,
                        college_title: widget.collegetitle,
                        course_number: courseNumber.text ,
                        desc_title: descTitle.text,
                        units: int.parse(dropDownvalue),
                      );

                      createSubject(registration, context);
                      context.read<AdminProvider>().addSubject(registration);

                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Enter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
