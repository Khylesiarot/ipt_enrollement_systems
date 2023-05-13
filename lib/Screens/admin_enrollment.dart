
import 'package:flutter/material.dart';

import '../widgets/admin_widgets/enrollments_offercode.dart';

class EnrollmentListsPage extends StatelessWidget {

   final String offerCode;
  final String title;
  final String description;


  const EnrollmentListsPage({Key? key, required this.offerCode, required this.title, required this.description}) : super(key: key);

  @override
   Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 247, 250),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: appBar(context),
      ),
      body: SingleChildScrollView(
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
                        "Enrollees",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.start,
                      )),
                ),
                SizedBox(child: EnrollmentLists(offerCode: offerCode,title: title,description: description,)),
              
              ],
            )),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all( 10),
        child: ClipOval(
          child: FloatingActionButton(
            onPressed: () {
             Navigator.pop(context);
            },
            backgroundColor: Colors.amber ,
            child: const Icon(Icons.arrow_left_rounded, size: 30,),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
     
    );
  }

  Widget appBar(context) {
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
           
          SizedBox(
             width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const SizedBox(
                  height: 65,
                ),
                
                Text(
                  offerCode,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                ),
                Text(title,
                    style: const TextStyle(fontSize: 15, color: Colors.black)),
              ],
            ),
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
        ],
      ),
    );
  }
}
