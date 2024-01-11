import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:test_task_1/core/entity/failure.dart';
import 'package:test_task_1/features/item_list/data/model/item_model.dart';
import 'package:test_task_1/features/item_list/data/services/item_service.dart';
import 'package:test_task_1/features/item_list/domain/entity/item.dart';
import 'package:test_task_1/features/item_list/domain/repository/items_repository.dart';

class PlaceholderRepository extends ItemsRepository {
  final ItemService itemService;

  PlaceholderRepository({required this.itemService});

  @override
  Future<Either<Failure, List<Item>>> loadItems(int albumNumber) async {
    print('asking service for data');
    final result = await itemService.fetchAlbum(albumNumber);
    print('data received');
    return result.fold(
      (l) {
        return left(l);
      },
      (r) {
        try {
          print(r.toString());
          final parsedResult = r.map((e) {
            return ItemModel.fromJson(e).toItem;
          }).toList();
          return(right(parsedResult));
        } catch (e) {
          print('catched $e}');
          return left(
            Failure(
              name: e.runtimeType.toString(),
              description: e.toString(),
            ),
          );
        }
      },
    );
  }
}
