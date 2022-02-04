 import 'package:flutter/material.dart';
 const String logoTvMaze = 'https://static.tvmaze.com/images/tvm-header-logo.png';
 AppBar titulo() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0.0,
      title: Image.network(logoTvMaze, height: 150, width: 150, )
      
    );
  }

  IconButton texto() {
    return IconButton( 
        icon: const Icon(Icons.search),
        onPressed: (){
          print("listo para realizar la busqueda");
        },);
  }
