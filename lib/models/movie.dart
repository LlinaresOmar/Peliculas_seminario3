import 'dart:convert';

class Movie {
    bool adult;
    String? backdropPath;    // Opcional
    List<int> genreIds;
    int id;
    String originalLanguage; // Ahora es solo un String
    String originalTitle;
    String overview;
    double popularity;
    String? posterPath;      // Opcional
    String? releaseDate;     // Opcional y de tipo String
    String title;
    bool video;
    double voteAverage;
    int voteCount;

    Movie({
        required this.adult,
        this.backdropPath,    // Opcional
        required this.genreIds,
        required this.id,
        required this.originalLanguage, // Directamente String
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        this.posterPath,      // Opcional
        this.releaseDate,     // Opcional y de tipo String
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    String get fullPosterImg{
      const String baseUrl = 'https://image.tmdb.org/t/p/w500';
      return (posterPath != null && posterPath!.isNotEmpty)
      ? '$baseUrl$posterPath'
      : 'https://i.stack.imgur.com/GNhxO.png'; 
    }

    factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],          // Puede ser null
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],  // Ya no mapeamos con EnumValues
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],              // Puede ser null
        releaseDate: json["release_date"],            // Es un String ahora, puede ser null
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,        // Solo pasamos el string
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,                  // Es un String ahora
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
