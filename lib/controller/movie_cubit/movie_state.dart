import 'package:fluttertest/model/show.dart';

abstract class MovieState{}
class MoviesInitial  extends MovieState{}
class MoviesLoading extends MovieState{}
class MoviesLoaded extends MovieState{
  final List<Show> movies;
  MoviesLoaded(this.movies);
}
class MoviesError  extends MovieState{
  final String message;
  MoviesError(this.message);
}

