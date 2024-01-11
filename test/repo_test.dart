
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_1/features/item_list/data/repository/placeholder_repository.dart';
import 'package:test_task_1/features/item_list/data/services/item_service.dart';

main()async{
  test('Test of repository and data parsing',() async {
    final itemService = ItemService.instance;
    final repo = PlaceholderRepository(itemService: itemService);
    final result  = await repo.loadItems(1);
    print(result.toString());
  });
}