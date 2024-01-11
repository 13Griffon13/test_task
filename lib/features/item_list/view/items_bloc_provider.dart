import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_1/features/item_list/view/list_screen/cubit/item_list_cubit.dart';

@RoutePage(name: 'ItemBlocProviderRoute')
class ItemListBlocProvider extends StatelessWidget implements  AutoRouteWrapper{
  const ItemListBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(create: (context)=> ItemListCubit(),child: this,);
  }
}
