import 'package:dartz/dartz.dart';
import 'package:test_task_1/core/entity/failure.dart';
import 'package:test_task_1/features/item_list/domain/entity/item.dart';

///Abstraction of repository, will allow us to make some changes in data layer
///without affecting the app

abstract class ItemsRepository{

  Future<Either<Failure, List<Item>>> loadItems(int albumNumber);

}