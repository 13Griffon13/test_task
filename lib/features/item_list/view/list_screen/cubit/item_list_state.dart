import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_1/core/entity/failure.dart';
import 'package:test_task_1/features/item_list/domain/entity/item.dart';

part 'item_list_state.freezed.dart';

@freezed
class ItemListState with _$ItemListState {
  const factory ItemListState({
    @Default([]) List<Item> items,
    String? searchRequest,
    List<Item>? searchResult,
    @Default(1) int albumsLoaded,
    Failure? error,
  }) = _ItemListState;

}