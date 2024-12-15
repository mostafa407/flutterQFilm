import 'package:flutter/material.dart';
import 'package:fluttertest/model/show.dart';

class DetailsPage extends StatelessWidget {
  final Show movie;

  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(movie.name??'Unknown Title'),
      ),
      body:
       Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (movie.image?.medium != null)
              Image.network(
                movie.image!.medium!,
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
            const SizedBox(height: 16.0),
            Text(
              movie.name ?? 'Unknown Title',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8.0),
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

    );
  }
}
