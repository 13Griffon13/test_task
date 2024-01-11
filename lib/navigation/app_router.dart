import 'package:auto_route/auto_route.dart';
import 'package:test_task_1/features/item_list/view/items_bloc_provider.dart';
import 'package:test_task_1/features/item_list/view/detail_screen/detail_screen.dart';
import 'package:test_task_1/features/item_list/view/list_screen/item_list_screen.dart';

part 'app_router.gr.dart';

///Using AutoRoute is probably overkill for this app but still it's pretty easy
///library to work with and I'm using freezed so code generation is a thing even
///without this library

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: ItemBlocProviderRoute.page,
          children: [
            AutoRoute(
              page: ItemListRoute.page,
              initial: true,
            ),
            AutoRoute(
              page: DetailsRoute.page,
            ),
          ],
        ),
      ];
}
