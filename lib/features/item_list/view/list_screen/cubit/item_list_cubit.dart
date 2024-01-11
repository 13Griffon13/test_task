import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_1/features/item_list/domain/repository/items_repository.dart';
import 'package:test_task_1/features/item_list/view/list_screen/cubit/item_list_state.dart';

class ItemListCubit extends Cubit<ItemListState> {
  final ItemsRepository itemRepository;

  ItemListCubit({
    required this.itemRepository,
  }) : super(const ItemListState());

  Future loadData() async {
    print('loading data');
    final data = await itemRepository.loadItems(2);
    print('data loaded');
    data.fold(
      (l) {
        ///Showing error and removing it from the state as it not affects
        /// future work of the cubit
        emit(state.copyWith(error: l));
        emit(state.copyWith(error: null));
      },
      (r) {
        emit(state.copyWith(items: r));
      },
    );
  }

  void defaultState(){
    emit(const ItemListState());
  }
}
