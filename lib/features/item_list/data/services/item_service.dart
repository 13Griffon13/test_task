import 'package:dio/dio.dart';
import 'package:test_task_1/features/item_list/data/services/endpoints.dart';

class ItemService {
  static ItemService get instance => ItemService._();

  static const Duration _timeout = Duration(seconds: 10);

  final Dio dio = Dio(BaseOptions(
    baseUrl: Endpoints.serviceAddress,
    receiveTimeout: _timeout,
    sendTimeout: _timeout,
    connectTimeout: _timeout,
  ));

  ItemService._();

  Future<List<dynamic>> fetchAlbum(int albumId) async {
    final result = await dio.get(
      Endpoints.getAlbumById(albumId),
    );
    if (result.data != null) {
      return result.data;
    } else {
      return [];
    }
  }
}
