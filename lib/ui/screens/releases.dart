import 'package:design_patterns/app/viewmodels/search_movies_viewmodel.dart';
import 'package:design_patterns/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class Releases extends StatelessWidget {
  final SearchMoviesViewmodel viewmodel = SearchMoviesViewmodel();

  Releases({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewmodel.getUpcomingMovies(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Image.asset(
                  "assets/images/upcoming.png",
                  height: 88,
                  width: 88,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Text(
                    "Próximos Lançamentos",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SliverList.builder(
                itemCount: viewmodel.moviesList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsGeometry.only(bottom: 32),
                  child: MovieCard(movie: viewmodel.moviesList[index]),
                ),
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
