import 'package:design_patterns/app/services/search_movies_service.dart';
import 'package:design_patterns/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatelessWidget {
  final SearchMoviesService searchMoviesService = SearchMoviesService();

  SearchMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: searchMoviesService.searchMovies(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Image.asset(
                  "assets/images/popular.png",
                  height: 88,
                  width: 88,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsetsGeometry.only(bottom: 40),
                  child: Text(
                    "Filmes Populares",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsetsGeometry.only(bottom: 32),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Pesquisar",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: const SizedBox(height: 32)),
              SliverList.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsGeometry.only(bottom: 32),
                  child: MovieCard(),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
