import 'package:test_task_1/features/item_list/domain/entity/item.dart';

abstract class ItemsRepository{

  Future<List<Item>> loadItems();

}