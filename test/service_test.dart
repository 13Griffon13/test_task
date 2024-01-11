

import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_1/features/item_list/data/services/item_service.dart';

main()async{
  test('api service test', ()async{
    final itemService = ItemService.instance;
    final result = await itemService.fetchAlbum(1);

  });

}