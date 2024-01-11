import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_task_1/features/item_list/domain/entity/item.dart';

part 'item_model.freezed.dart';

part 'item_model.g.dart';

///Item model allow our entity inside the app to be independent from one that
///we receiving from back end

@freezed
class ItemModel with _$ItemModel {
  const ItemModel._();

  const factory ItemModel({
    required int albumId,
    required int id,
    required String title,
    required String url,
    required String thumbnailUrl,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Item get toItem => Item(
        name: 'Album #$albumId, Photo#$id',
        shortDescription: title,
        thumbnail: thumbnailUrl,
        sourceUrl: url,
      );
}
