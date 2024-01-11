import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_list_state.freezed.dart';

@freezed
class ItemListState with _$ItemListState {
  const factory ItemListState({
    @Default('') String mock,
  }) = _ItemListState;

}