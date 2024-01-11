import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_1/features/item_list/view/list_screen/cubit/item_list_state.dart';

class ItemListCubit extends Cubit<ItemListState>{
  ItemListCubit():super(const ItemListState());

}