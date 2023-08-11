import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        width: double.maxFinite,
        height: 300,
        child: Hero (
          tag: 'image',
          child: Image.asset('assets/images/fastfood.jpg'),
        ),
      )
    );
  }

}
