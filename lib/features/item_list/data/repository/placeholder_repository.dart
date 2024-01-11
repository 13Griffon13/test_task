import 'package:test_task_1/features/item_list/domain/entity/item.dart';
import 'package:test_task_1/features/item_list/domain/repository/items_repository.dart';

class PlaceholderRepository extends ItemsRepository{
  @override
  Future<List<Item>> loadItems() {
    // TODO: implement loadItems
    throw UnimplementedError();
  }

}