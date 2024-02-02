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

      body:
      //  Container(
      //   color: Colors.purple,
      //  // padding: const EdgeInsets.sym(20.0),
      // //  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50.0),
      // padding: const EdgeInsets.fromLTRB(20.0, 50.0, 100.0, 150.0),
      // margin: const EdgeInsets.all(20.0),
      //   child: const Text("suck off",
      //   style: TextStyle(
      //     color: Colors.white,
      //   ),
      //   ),
      // ), 
      //const Center(z
        // child: Image(
        //   image: AssetImage("assets/ds.jpg"),
        //   fit: BoxFit.fitHeight,
        // ), 
        // child: Image(
        //   fit:  BoxFit.fill,
        //   image: NetworkImage("https://images.pexels.com/photos/12730085/pexels-photo-12730085.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
        // ),
        // child:IconButton(
        //   onPressed: (){
        //     print("hi there");
        //   },
        //   icon: const Icon(Icons.warning_amber),
        //   color: Colors.amber,
        //   ),
        // child: TextButton.icon(
        //   label: const Text("hi there"),
        //   icon: const Icon(
        //     Icons.ac_unit_sharp,
        //     size: 50.0,
        //     color: Colors.red,
        //   ),
        //   onPressed: () {
        //     print('button Pressed');
        //   }, 
        //   style: const ButtonStyle(
        //     backgroundColor: MaterialStatePropertyAll(Colors.blue),
        //   ),
        //   // child: const Text("Hi There",
        //   // style:  TextStyle(
        //   //   color: Colors.green,
        //   // ),
        //   // ),
        //   ),
        // child: ElevatedButton(
        //   onPressed: null,
        //   style: ButtonStyle(
        //     backgroundColor: MaterialStatePropertyAll(Colors.red),
        //   ),
        //   child:Text(
        //     "hi there",
        //     style:TextStyle(
        //       color: Colors.white,
        //     ) ,
        //     ),
        // ),
          // child: Text(
          //     "Hello There",
          //   style: TextStyle(
          //     fontSize: 20.0,
          //     color: Colors.red[400],
          //     fontWeight: FontWeight.bold,
          //     letterSpacing: 2.0,
          //     fontFamily: "MyFont"
          //   ),
          // ),

     // ),
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
