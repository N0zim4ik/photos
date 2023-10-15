import 'package:dio/dio.dart';
import 'package:photos/constants/api_keys.dart';
import 'package:photos/models/pinterest_model.dart';

class Repository {
  final Dio _dio;

  Repository()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://api.unsplash.com',
          headers: head2,
        ));

  Future<Pinterest?> getData([int? page, String place = '']) async {
    try {
      Response response = await _dio.get(
        '/search/photos',
        queryParameters: ApiKeys.query(place, page),
      );
      return Pinterest.fromJSon(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
