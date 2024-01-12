import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_1/core/widgets/error_dialog.dart';
import 'package:test_task_1/features/item_list/domain/entity/item.dart';
import 'package:test_task_1/features/item_list/view/list_screen/cubit/item_list_cubit.dart';
import 'package:test_task_1/features/item_list/view/list_screen/cubit/item_list_state.dart';
import 'package:test_task_1/features/item_list/view/list_screen/list_tile.dart';
import 'package:test_task_1/locales/strings.dart';

@RoutePage(name: 'ItemListRoute')
class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  late final ItemListCubit cubit;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cubit = context.read<ItemListCubit>();
    cubit.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchBar(
                  controller: _searchController,
                  leading: const Icon(
                    Icons.search,
                  ),
                  onChanged: (request) {
                    cubit.search(request);
                  },
                  trailing: [
                    TextButton(
                      onPressed: () {
                        _searchController.clear();
                        cubit.search(_searchController.text);
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                  hintText: Strings.search,
                ),
                Flexible(
                  child: BlocConsumer<ItemListCubit, ItemListState>(
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
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        final List<Item> list;
                        if (state.searchResult != null) {
                          list = state.searchResult!;
                        } else {
                          list = state.items;
                        }
                        return RefreshIndicator(
                          onRefresh: () async {
                            cubit.loadData();
                          },
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 800.0,
                            ),
                            child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return CustomListTile(item: list[index]);
                              },
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    cubit.defaultState();
    super.dispose();
  }
}
