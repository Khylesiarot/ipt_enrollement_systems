import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/Screens/user_profile_screen.dart';
import 'package:ipt_enrollement_systems/widgets/user_widgets.dart/departmentSubjects.dart';
import 'package:provider/provider.dart';

import '../providers/admin_provider.dart';
import '../widgets/user_widgets.dart/colleges_available.dart';
import '../widgets/user_widgets.dart/enrolled_subjects.dart';

class Homepage extends StatefulWidget {
  final bool isAdmin;
  const Homepage({Key? key, required this.isAdmin}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<AdminProvider>();
    final subjects = userProvider.subjects;
    final enrollments = userProvider.enrollment;
    final user = userProvider.user;
    final userId = user[0].studentId;
    final dept = user[0].college;
    final totalUnits = userProvider.totalUnits;
  
    List<Widget> tabs = <Widget>[
     SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "All colleges",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.start,
                      )),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(child: CollegesAvlble(isAdmin: widget.isAdmin,id: userId,)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child:  Text(
                        "$dept subjects",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.start,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(child: DeptSubjects(dept: dept,isAdmin: widget.isAdmin,userId: userId,)),
                ),
              ],
            )),
          ],
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          const Text(
                            "Subjects Enrolled",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            textAlign: TextAlign.start,
                          ),
                          Expanded(child: SizedBox(),),
                           Text(
                            "Total Units: $totalUnits",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(child: EnrooledSubjects(dept: dept,isAdmin: widget.isAdmin,userId: userId,)),
                ),
              ],
            )),
          ],
        ),
      ),
      
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 247, 250),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: appBar(context,userProvider)
      ),
      body: tabs[selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Library',
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar( context, AdminProvider userProvider) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: 140,
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  const [
              SizedBox(
                height: 65,
              ),
              Text(
                "HELLO, STUDENT" ,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.black),
              ),
              Text('Have a nice day!',
                  style: TextStyle(fontSize: 15, color: Colors.black)),
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                 Navigator.of(context).push(
                    MaterialPageRoute(builder: (contex) =>  UserProfile(user: userProvider,)));
              },
              child: Container(
                color: Colors.amber,
                height: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            color: Colors.white54,
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 40,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
