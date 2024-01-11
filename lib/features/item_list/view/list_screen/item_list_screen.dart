import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_1/core/widgets/error_dialog.dart';
import 'package:test_task_1/features/item_list/view/list_screen/cubit/item_list_cubit.dart';
import 'package:test_task_1/features/item_list/view/list_screen/cubit/item_list_state.dart';
import 'package:test_task_1/locales/strings.dart';

@RoutePage(name: 'ItemListRoute')
class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  late final ItemListCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<ItemListCubit>();
    cubit.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ItemListCubit, ItemListState>(
        bloc: cubit,
        listener: (BuildContext context, ItemListState state) {
          if (state.error != null) {
            showDialog(
              context: context,
              builder: (context) => ErrorDialog(
                failure: state.error!,
              ),
            );
          }
        },
        builder: (BuildContext context, ItemListState state) {
          return Column(
            children: [
              SearchBar(
                leading: const Icon(
                  Icons.search,
                ),
                hintText: Strings.search,
              ),
              Flexible(
                child: RefreshIndicator(
                  onRefresh: () {
                    return cubit.loadData();
                  },
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return ListTile(
                        leading: Image.network(
                          item.thumbnail,
                          loadingBuilder: (context, child, progress) {
                            return const CircularProgressIndicator();
                          },
                        ),
                        title: Text(item.name),
                        subtitle: Text(item.shortDescription),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    cubit.defaultState();
    super.dispose();
  }
}
