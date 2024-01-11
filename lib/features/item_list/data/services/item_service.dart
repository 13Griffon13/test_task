import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_task_1/core/entity/failure.dart';
import 'package:test_task_1/features/item_list/data/services/endpoints.dart';

class ItemService {
  static ItemService get instance => ItemService._();

  static final Duration _timeout = const Duration(seconds: 10);

  final Dio dio = Dio(BaseOptions(
    baseUrl: Endpoints.serviceAddress,
    receiveTimeout: _timeout,
    sendTimeout: _timeout,
    connectTimeout: _timeout,
  ));

  ItemService._();

  Future<Either<Failure, List<dynamic>>> fetchAlbum(int albumId) async {
    try {
      print('making request');
      print(albumId);
      final result = await dio.get(
        Endpoints.getAlbumById(albumId),
      );
      print('result received');
      if (result.data != null) {
        return right(result.data);
      } else {
        return left(const Failure(name: 'Failed to obtain data'));
      }
    } catch (e) {
      return left(Failure(
        name: e.runtimeType.toString(),
        description: e.toString(),
      ));
    }
  }
}
