import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/controller/movie_cubit/movie_cubit.dart';
import 'package:fluttertest/controller/movie_cubit/movie_state.dart';
import 'package:fluttertest/views/screen/details.dart';
import 'package:fluttertest/views/widgets/buildsearch.dart';
import 'package:fluttertest/views/widgets/buildappbarTitle.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSearched = false;

  // This function is used to switch between search mode and normal mode
  void toggleSearch() {
    setState(() {
      isSearched = !isSearched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearched ? builSearchField() : buildAppBarTitle(),
        actions: [
          IconButton(
            onPressed: () {
              toggleSearch(); // Toggle search mode
            },
            icon: Icon(
              isSearched ? Icons.close : Icons.search,
              color: Colors.white,
            ),
          ),
          // You can add more icons/actions here if needed
        ],
      ),
      body: BlocProvider(
        create: (context) => MovieCubit()..fetchMovies(),
        child: BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state is MoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MoviesLoaded) {
              final movies = state.movies;

              if (movies.isEmpty) {
                return const Center(
                  child: Text('No movies found.'),
                );
              }

              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetailsPage(movie: movie);
                      },));
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Thumbnail Image
                          if (movie.image?.medium != null)
                            Image.network(
                              movie.image!.medium!,
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            )
                          else
                            Container(
                              width: 100,
                              height: 150,
                              color: Colors.grey,
                              child: const Icon(
                                Icons.movie,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),

                          const SizedBox(width: 10),

                          // Movie Details
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title
                                  Text(
                                    movie.name ?? 'Unknown Title',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 5),

                                  // Summary
                                  Text(
                                    movie.summary != null
                                        ? movie.summary!
                                        .replaceAll(RegExp(r'<[^>]*>'), '')
                                        : 'No summary available.',
                                    style: const TextStyle(fontSize: 14),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is MoviesError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            return const Center(
              child: Text('Something went wrong!'),
            );
          },
        ),
      ),
    );
  }
}