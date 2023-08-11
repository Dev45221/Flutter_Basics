import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  var data = "";

  DashboardPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text("Dashboard "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome to Dashboard,\n $data", style: const TextStyle( fontSize: 16, fontWeight: FontWeight.w700 ),),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.pop(context,
            //       MaterialPageRoute(builder: (context) =>   const MyHomePage()));
            //     },
            //     child: const Text("Back", style: TextStyle( fontSize: 20, fontWeight: FontWeight.w700), ),)
          ],
        ),
      ),
    );
  }

}