import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("My First App"),
        centerTitle:true,
        backgroundColor: Colors.blue[600],
        titleTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),

      body: Center(
          child: Text(
              "Hello There",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.red[400],
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              fontFamily: "MyFont"
            ),
          ),

      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.green,
        child: Text("Click ME",
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
    ),
  ));
}
