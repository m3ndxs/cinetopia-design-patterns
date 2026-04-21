import 'package:design_patterns/app/viewmodels/search_movies_viewmodel.dart';
import 'package:design_patterns/ui/components/movie_card.dart';
import 'package:design_patterns/ui/screens/details_movie.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatefulWidget {
  const SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  final SearchMoviesViewmodel viewmodel = SearchMoviesViewmodel();

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewmodel.getMovie(textController.text),
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
                    controller: textController,
                    onEditingComplete: () {
                      FocusScope.of(context).unfocus();
                      setState(() {});
                    },
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
                itemCount: viewmodel.moviesList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsMovie(
                        movie: viewmodel.moviesList[index],
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsGeometry.only(bottom: 32),
                    child: MovieCard(movie: viewmodel.moviesList[index]),
                  ),
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
