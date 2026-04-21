import 'package:design_patterns/app/models/movie.dart';
import 'package:design_patterns/app/services/search_movies_service.dart';

class SearchMoviesViewmodel {
  List<Movie> _moviesList = <Movie>[];

  List<Movie> get moviesList => _moviesList;

  Future<List<Movie>> getPopularMovies() async {
    final SearchMoviesService service = SearchPopularMoviesService();
    _moviesList = await service.getMovies();

    return _moviesList;
  }

  Future<List<Movie>> getMovie(String query) async {
    if (query.isEmpty) {
      _moviesList = await getPopularMovies();
    } else {
      final SearchMoviesService service = SearchForMovie(query: query);
      _moviesList = await service.getMovies();
    }

    return _moviesList;
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final SearchMoviesService service = SearchMoviesUpcoming();
    _moviesList = await service.getMovies();

    return _moviesList;
  }
}
