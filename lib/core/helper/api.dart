import 'package:dio/dio.dart';
import 'package:fluttertest/core/constant/end_point.dart';
import 'package:fluttertest/model/show.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<SearchResult>> fetchShows({required String query}) async {
    try {
      final response = await _dio.get(
        '${EndPoint.baseUrl}${EndPoint.searchEndpoint}',
        queryParameters: EndPoint.queryParameters,
      );

      final results = (response.data as List)
          .map((json) => SearchResult.fromJson(json))
          .toList();

      return results;
    } catch (e) {
      throw Exception('Failed to fetch shows: $e');
    }
  }
}
