import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_task_1/features/item_list/domain/repository/items_repository.dart';
import 'package:test_task_1/features/item_list/view/list_screen/cubit/item_list_state.dart';

class ItemListCubit extends Cubit<ItemListState> {
  final ItemsRepository itemRepository;
  final StreamController<String> _requestController = StreamController();
  final Duration _debounceDuration = const Duration(seconds: 1);
  late final StreamSubscription _searchSubscription;

  ItemListCubit({
    required this.itemRepository,
  }) : super(const ItemListState()) {
    _searchSubscription =
        _requestController.stream.debounceTime(_debounceDuration).listen(
      (event) {
        if (state.searchRequest.isNotEmpty) {
          _performSearch(event);
        } else {
          emit(state.copyWith(searchResult: null));
        }
      },
    );
  }

  Future loadData() async {
    if (!state.isLoading) {
      emit(state.copyWith(isLoading: true));
      final data = await itemRepository.loadItems(2);
      data.fold(
        (l) {
          ///Showing error and removing it from the state as it not affects
          /// future work of the cubit
          emit(state.copyWith(error: l, isLoading: false));
          emit(state.copyWith(error: null));
        },
        (r) {
          emit(state.copyWith(items: r, isLoading: false));
        },
      );
    }
  }

  ///Not sure that search should happen among loaded items or from API,
  ///but I think this API do not provide search functionality
  void search(String request) {
    emit(state.copyWith(searchRequest: request));
    _requestController.sink.add(request);
  }

  void _performSearch(String request) {
    final result = state.items.where((element) {
      return element.name.contains(request);
    }).toList();
    emit(state.copyWith(searchResult: result));
  }

  void defaultState() {
    emit(const ItemListState());
  }

  @override
  Future<void> close() {
    _requestController.close();
    _searchSubscription.cancel();
    return super.close();
  }
}
