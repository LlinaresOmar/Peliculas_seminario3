import 'dart:convert';

import 'package:peliculas/models/movie.dart';

class PopularResponse {
    int page;
    List<Movie> movies;
    int totalPages;
    int totalResults;

    PopularResponse({
        required this.page,
        required this.movies,
        required this.totalPages,
        required this.totalResults,
    });

    factory PopularResponse.fromRawJson(String str) => PopularResponse.fromJson(json.decode(str));

    factory PopularResponse.fromJson(Map<String, dynamic> json) => PopularResponse(
        page: json["page"],
        movies: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}