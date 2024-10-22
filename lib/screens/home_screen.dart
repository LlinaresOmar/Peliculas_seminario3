// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines', style: TextStyle(color: Colors.white),),
        actions: [
          Icon(Icons.search_outlined, color: Colors.white)
        ],
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            // Tarjetas principales
            CardSwiper(),
            
            //Slider Peliculas
            MovieSliderHorizontal()
            ],
        ),
      )
    );
  }
}