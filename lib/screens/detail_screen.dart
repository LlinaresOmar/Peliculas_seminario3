// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:peliculas/widgets/card_swiper.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recoger el argumento
    final String? argumento =
        ModalRoute.of(context)?.settings.arguments?.toString() ?? 'no-movie';

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosertAndTitle(),
                _Overview(),
                _Overview(),
                _Overview(),
                _Overview(),
                _Overview(),
                CastingCards()
              ]
            )
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            'movie.title',
            style: TextStyle(
              fontSize: 16
            ),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'),
          image: NetworkImage('https://placehold.co/500x300.jpeg'),
          fit: BoxFit.cover
        ),
      ),
    );
  }
}

class _PosertAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              height: 150,
              placeholder: AssetImage('assets/no-image.jpf'),
              image: NetworkImage('https://placehold.co/200x300.jpeg')),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie.originalTitle',
                style: textTheme.labelLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  Icon(Icons.star_rate_outlined, size: 15, color: Colors.grey),
                  SizedBox(width: 5),
                  Text('movie.voteAverage', style: textTheme.labelSmall)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed faucibus metus quis consectetur commodo. Ut sit amet massa quis tortor posuere gravida sed molestie arcu. Proin volutpat nulla tellus, ullamcorper hendrerit mauris tincidunt non. Morbi vestibulum erat sed pharetra consectetur. Praesent id vulputate purus. Aliquam nunc tellus, mollis mollis nibh vel, lacinia pharetra ipsum. In et mi a tellus imperdiet iaculis. Nunc maximus convallis libero, vitae ullamcorper leo ultrices eget. Suspendisse potenti. Morbi volutpat augue enim, ac rutrum turpis ultrices ullamcorper. '
      ),
    );
  }
}