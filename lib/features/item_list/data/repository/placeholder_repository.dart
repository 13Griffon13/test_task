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
    try {
      final result = await itemService.fetchAlbum(albumNumber);
      final parsedResult = result.map((e) {
        return ItemModel
            .fromJson(e)
            .toItem;
      }).toList();
      return (right(parsedResult));
    } catch (e) {
      return left(
        Failure(
          name: e.runtimeType.toString(),
          description: e.toString(),
        ),
      );
    }
  }
}
