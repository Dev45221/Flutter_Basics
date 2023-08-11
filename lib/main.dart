import 'dart:async';

import 'package:basics_flutter/pages/ContactPage.dart';
import 'package:basics_flutter/pages/DashboardPage.dart';
import 'package:basics_flutter/pages/DetailPage.dart';
import 'package:basics_flutter/pages/HomePage.dart';
import 'package:basics_flutter/pages/SplashPage.dart';
import 'package:basics_flutter/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  var current_page = DrawerSections.home;

  @override
  Widget build(BuildContext context) {

    var container;

    if (current_page == DrawerSections.home) {
      container = HomePage();
    } else if (current_page == DrawerSections.contacts) {
      container = ContactPage();
    } else if (current_page == DrawerSections.events) {
      container = HomePage();
    } else if (current_page == DrawerSections.settings) {
      container = HomePage();
    } else if (current_page == DrawerSections.notifications) {
      container = HomePage();
    } else if (current_page == DrawerSections.send_feedback) {
      container = HomePage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Basics"),
      ),
      body:

      container,

      drawer:  Drawer(
        backgroundColor: Colors.yellow,
        elevation: 20.0,
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlue
                ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white60,
                        minRadius: 60,
                        child: Icon(Icons.add_a_photo, size: 35,),
                      ),
                      SizedBox(height: 10,),
                      Text("Devansh Rambadia", style: TextStyle( fontSize: 18, color: Colors.white ),),
                      SizedBox(height: 5,),
                      Text("devrambadia@gmail.com", style: TextStyle( fontSize: 18, color: Colors.white ),),
                    ],
                  )
              ),
            ),
            Expanded(
              flex: 2,
                child: DrawerItemList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget DrawerItemList() {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(height: 5,),
          DrawerItemSelected(1, Icons.home, "Home", current_page == DrawerSections.home ? true : false),
          const SizedBox(height: 5,),
          DrawerItemSelected(2, Icons.call, "Contacts", current_page == DrawerSections.contacts ? true : false),
          const SizedBox(height: 5,),
          DrawerItemSelected(3, Icons.notes, "Events", current_page == DrawerSections.events ? true : false),
          const Divider(color: Colors.lightBlue),
          DrawerItemSelected(4, Icons.settings, "Settings", current_page == DrawerSections.settings ? true : false),
          const SizedBox(height: 5,),
          DrawerItemSelected(5, Icons.notifications, "Notifications", current_page == DrawerSections.notifications ? true : false),
          const SizedBox(height: 5,),
          DrawerItemSelected(6, Icons.feedback, "Send Feedback", current_page == DrawerSections.send_feedback ? true : false),
        ],
      )
    );
  }

  Widget DrawerItemSelected(int id, IconData icon, String title, bool selected) {
    return Material(
      color: selected ? Colors.lightBlue.shade100 : Colors.transparent ,
      child: InkWell(
          onTap: (){
            Navigator.pop(context);
            setState(() {
              if (id == 1) {
                current_page = DrawerSections.home;
              } else if (id == 2) {
                current_page = DrawerSections.contacts;
              } else if (id == 3) {
                current_page = DrawerSections.events;
              } else if (id == 4) {
                current_page = DrawerSections.settings;
              } else if (id == 5) {
                current_page = DrawerSections.notifications;
              } else if (id == 6) {
                current_page = DrawerSections.send_feedback;
              }
            });
          },
          child:  Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(icon),
                ),
                Expanded(
                    flex: 4,
                    child: Text(title, style: const TextStyle( fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 2 ),)
                ),
              ],
            ),
          ),
        ),
    );
  }

}

enum DrawerSections {
  home,
  contacts,
  events,
  settings,
  notifications,
  send_feedback,
}

// class threeD_List extends StatelessWidget {
//   var arr = [
//     'Devansh',
//     'Varun',
//     'Nidhi',
//     'Tanisha',
//     'Meet',
//     'Mohik',
//     'Uttam',
//     'Devansh',
//     'Varun',
//     'Nidhi',
//     'Tanisha',
//     'Meet',
//     'Mohik',
//     'Uttam'
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       height: double.maxFinite,
//       child: ListWheelScrollView(
//           itemExtent: 200,
//           children: arr.map((value) => Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   width: double.maxFinite,
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(20)
//                   ),
//                   child: Text(value, style: const TextStyle( fontSize: 30, ),),
//                 ),
//               )
//           ).toList(),
//       ),
//     );
//   }
//
// }

