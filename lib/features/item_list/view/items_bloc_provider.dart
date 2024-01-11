import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_1/features/item_list/data/repository/placeholder_repository.dart';
import 'package:test_task_1/features/item_list/data/services/item_service.dart';
import 'package:test_task_1/features/item_list/domain/repository/items_repository.dart';
import 'package:test_task_1/features/item_list/view/list_screen/cubit/item_list_cubit.dart';

@RoutePage(name: 'ItemBlocProviderRoute')
class ItemListBlocProvider extends StatelessWidget implements AutoRouteWrapper {
  const ItemListBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (context) {
      ///Usually services, repositories and use cases initialised in getIt,
      ///but here it used only one time so it's kind of loses a point to
      ///implement di
      final itemService = ItemService.instance;
      final itemsRepository = PlaceholderRepository(itemService: itemService);
      return ItemListCubit(itemRepository: itemsRepository);
    }
      , child: this,);
  }
}
