import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task_1/core/entity/failure.dart';
import 'package:test_task_1/locales/strings.dart';

class ErrorDialog extends StatelessWidget {
  final Failure failure;

  const ErrorDialog({
    super.key,
    required this.failure
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(failure.name),
      content: failure.description != null ? Text(failure.description!) : null,
      actions: [
        TextButton(
          onPressed: () {
            context.popRoute();
          },
          child: Text(Strings.ok),
        )
      ],
    );
  }
}
