import 'package:design_patterns/app/models/movie.dart';
import 'package:flutter/material.dart';

class DetailsMovie extends StatelessWidget {
  final Movie movie;
  
  const DetailsMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF120326),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Center(
        child: Column(
          children: [
            Image.asset("assets/images/movie.png", height: 88, width: 88),
            Padding(
              padding: const EdgeInsetsGeometry.only(bottom: 32),
              child: Text(
                movie.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsetsGeometry.only(bottom: 40),
              child: Container(
                height: 235,
                width: 176,
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(movie.getPosterImage()),
                    fit: BoxFit.cover,
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Descrição", 
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 16,),
                    Text(
                      movie.overview,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
