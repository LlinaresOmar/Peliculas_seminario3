import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:peliculas/models/movie.dart';

class CardSwiper extends StatelessWidget {

  final List<Movie> movies;

  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (movies.length == 0){
      return Container(
        width: double.infinity,
        height: size.height * 0.56,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      margin: EdgeInsets.only(top: 10),
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.5,
        itemBuilder: (_, int index) {
            final movie = movies[index];
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(
                context,
                'details_screen', // Ruta de destino
                arguments: movie.id,
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.fill,
              )
            ),
          );
        },
      ),
    );
  }
}
