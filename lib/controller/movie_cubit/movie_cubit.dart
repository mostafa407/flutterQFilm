import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/controller/movie_cubit/movie_state.dart';
import 'package:fluttertest/core/helper/api.dart';


class MovieCubit extends Cubit<MovieState>{
  MovieCubit():super(MoviesInitial());
  Future<void> fetchMovies() async {
    emit(MoviesLoading());

    try {
      final results = await ApiService().fetchShows(query: 'all');
      final movies = results.map((result) => result.show!).toList();
      emit(MoviesLoaded(movies));
    } catch (e) {
      emit(MoviesError('Failed to load movies: $e'));
    }
  }

// Future<void> fetchMovies() async{
  //   emit(MoviesLoading());
  //
  //   try{
  //     final response=await Dio().get(EndPoint.baseUrl,queryParameters: EndPoint.queryParameters
  //     );
  //      print('Raw API response: ${response.data}');
  //      //final results = response.data as List? ?? [];
  //     final results = (response.data as List?) ?? [];
  //     final movies = results.map((json) => Show.fromJson(json)).toList();
  //     emit(MoviesLoaded(movies)); // Emit loaded state with movies
  //   }catch (e,stackTrace){
  //     emit(MoviesError('Failed to load movies: ${e.toString()}'));
  //     print('Error fetching movies: $e');
  //     print('StackTrace: $stackTrace');      // Emit error state
  //
  //   }
  // }

}