import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:test_task_1/features/item_list/domain/entity/item.dart';

@RoutePage(name: 'DetailsRoute')
class DetailScreen extends StatelessWidget {
  final Item item;

  const DetailScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  item.sourceUrl,
                  loadingBuilder: (context, child, progress) {
                    if(progress == null){
                      return child;
                    }else {
                      return  const CircularProgressIndicator();
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Description: ${item.shortDescription}'),
                ),
        
                Text('Full description:\n${item.fullDescription}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
