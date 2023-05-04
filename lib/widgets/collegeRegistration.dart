import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/colleges.dart';
import '../providers/admin_provider.dart';

class CollegeRegistrationForm extends StatefulWidget {
  const CollegeRegistrationForm({super.key});

  @override
  State<CollegeRegistrationForm> createState() => _CollegeRegistrationFormState();
}

class _CollegeRegistrationFormState extends State<CollegeRegistrationForm> {

  final title = TextEditingController();
  final desc = TextEditingController();





    @override
  void dispose() {
    title.dispose();
    desc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
      var uuid = const Uuid();
        var id = uuid.v4();
          final adminProvider = context.watch<AdminProvider>();
    final admins = adminProvider.admins;
      final adminId = admins[0].adminId;

    return  AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add College',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 8),
          
          TextField(
            controller: title,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              hintText: 'Input To Do item here',
              labelText: 'Title',
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: desc,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Description',
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
               TextButton(
                  onPressed: () {




                    if (title.text.isNotEmpty && desc.text.isNotEmpty)  {
                      College registration =  College(
                       collegeId: id,
                       collegeAdminId: adminId,
                       title: title.text,
                       description: desc.text,

                      );

                      createCollege(registration, context);
                      context.read<AdminProvider>().addCollege(registration);
                      
              
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