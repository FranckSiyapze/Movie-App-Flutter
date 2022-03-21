import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/http_service.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;
  late HTTPService _http;

  MovieService() {
    _http = getIt.get<HTTPService>();
  }

  Future<List<Movie>> getPopularMovies({int? page}) async {
    List<Movie> _movies = [];
    Response _response = await _http.get('/movie/popular', query: {
      'page': page,
    });
    if (_response.statusCode == 200) {
      Map _data = _response.data;
      //print(_data);
      _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
    } else {
      throw Exception("Couldn't load Movies");
    }
    return _movies;
  }

  Future<List<Movie>> getUpComingMovies({int? page}) async {
    List<Movie> _movies = [];
    Response _response = await _http.get('/movie/upcoming', query: {
      'page': page,
    });
    if (_response.statusCode == 200) {
      Map _data = _response.data;
      //print(_data);
      _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
    } else {
      throw Exception("Couldn't upcoming load Movies");
    }
    return _movies;
  }

  Future<List<Movie>> searchMovies(String _searchTerm, {int? page}) async {
    List<Movie> _movies = [];
    Response _response = await _http.get('/search/movie', query: {
      'query': _searchTerm,
      'page': page,
    });
    if (_response.statusCode == 200) {
      Map _data = _response.data;
      //print(_data);
      _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
    } else {
      throw Exception("Couldn't perform movies search.");
    }
    return _movies;
  }
}
