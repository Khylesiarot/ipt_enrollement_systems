import 'package:flutter/material.dart';
import 'package:ipt_enrollement_systems/Screens/admin_profile.dart';
import 'package:ipt_enrollement_systems/widgets/admin_widgets/all_colleges.dart';
import 'package:ipt_enrollement_systems/widgets/admin_widgets/createdColleges.dart';
import 'package:provider/provider.dart';

import '../providers/admin_provider.dart';
import '../widgets/admin_widgets/createdSubjects.dart';
import '../widgets/collegeRegistration.dart';

class AdminHomepage extends StatefulWidget {
  final bool isAdmin;
  const AdminHomepage({Key? key, required this.isAdmin}) : super(key: key);

  @override
  State<AdminHomepage> createState() => _AdminHomepageState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final adminProvider = context.watch<AdminProvider>();
    final admins = adminProvider.admins;
    final adminId = admins[0].adminId;
  
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
                        "Colleges",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.start,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(child: AllColleges(id: adminId, isAdmin: widget.isAdmin,)),
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
                      child: const Text(
                        "Created colleges",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.start,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(child: CreateColleges(adminId: adminId, isAdmin: widget.isAdmin,)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Created subjects",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.start,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(child: CreateSubjects(adminId: adminId, isAdmin: widget.isAdmin,)),
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
        child: appBar(context, adminId)
      ),
      body: tabs[selectedIndex],
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          onPressed: () {
           if(selectedIndex == 0) {showDialog(
              context: context,
              builder: (context) => const CollegeRegistrationForm(),
              barrierDismissible: false,
            );}
          },
          backgroundColor:selectedIndex == 0 ? Colors.amber : Colors.amber[100],
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

  Widget appBar( context, String adminId) {
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
                "HELLO, ADMIN" ,
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
            child: Container(
              color: Colors.amber,
              height: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                    MaterialPageRoute(builder: (contex) =>  AdminProfile(adminId: adminId,)));
                    },
                    child: Padding(
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
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
