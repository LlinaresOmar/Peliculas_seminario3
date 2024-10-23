// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/models/now_playing_response.dart';

class MoviesProviders extends ChangeNotifier {
  String _apikey = 'e1b875a9cc95b250222aad4d393b3ad1';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProviders(){
    print('MoviesProvider inicializando');
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);

    // Decodificamos el cuerpo de la respuesta a un Map<String, dynamic>
    final Map<String, dynamic> decodedData = json.decode(response.body);

    // Usamos el mapa decodificado para crear NowPlayingResponse
    final nowPlayingResponse = NowPlayingResponse.fromJson(decodedData);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();

    print(nowPlayingResponse.results[0].title);
  }

  getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);

    // Decodificamos el cuerpo de la respuesta a un Map<String, dynamic>
    final Map<String, dynamic> decodedData = json.decode(response.body);

    // Usamos el mapa decodificado para crear NowPlayingResponse
    final popularResponse = NowPlayingResponse.fromJson(decodedData);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}
