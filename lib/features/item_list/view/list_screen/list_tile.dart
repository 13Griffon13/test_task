import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task_1/features/item_list/domain/entity/item.dart';
import 'package:test_task_1/navigation/app_router.dart';

class CustomListTile extends StatelessWidget {
  final Item item;

  const CustomListTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 80.0,
        width: 80.0,
        child: Image.network(
          item.thumbnail,
          loadingBuilder: (context, child, progress) {
            if (progress == null) {
              return child;
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      title: Text(item.name),
      subtitle: Text(item.shortDescription),
      onTap: () {
        context.pushRoute(DetailsRoute(item: item));
      },
    );
  }
}
