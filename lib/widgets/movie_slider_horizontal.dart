import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';

class MovieSliderHorizontal extends StatelessWidget {
  final List<Movie> movies;
  final String? title;

  const MovieSliderHorizontal({super.key, required this.movies, this.title});

  @override
  Widget build(BuildContext context) {


    if (movies.length == 0) {
      return Container(
        margin: EdgeInsets.only(top: 100),
        width: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mostrar el Padding solo si el title no es nulo
          if (title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "$title",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return _MoviePoster(movie: movies[index]);
                  }))
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;

  const _MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    print(movie
        .fullPosterImg); // Agrega esta línea en el constructor de _MoviePoster
    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                'details', // Ruta de destino
                arguments:
                    movie, // Por ahora pasamos un String vacío como argumento
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
                height: 140,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
