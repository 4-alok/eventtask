import 'package:dio/dio.dart';
import '../repository/api_repository.dart';

class RemoteDatasource implements ApiRepository {
  late final Dio dio;
  RemoteDatasource() {
    dio = Dio();
    dio.options = BaseOptions(
      baseUrl: "http://104.155.187.128:9999/api/",
      receiveTimeout: 30000,
      connectTimeout: 30000,
      contentType: 'application/json',
    );
  }

  @override
  Future createEvent(Map<String, dynamic> data) async {
    // TODO: POST request to create event
    throw UnimplementedError();
  }

  @override
  Future updateEvent(Map<String, dynamic> data) {
    // TODO: POST request to update event
    throw UnimplementedError();
  }

  @override
  Future uploadImage(Map<String, dynamic> data) async {
    final res = await dio.post(
      'upload',
      data: data,
    );
    return res.data;
  }
}
