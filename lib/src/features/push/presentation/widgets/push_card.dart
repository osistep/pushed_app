import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_mvp_app/src/features/push/data/models/push.dart';

class PushCard extends StatelessWidget {
  const PushCard({super.key});

  @override
  Widget build(BuildContext context) {
    final push = context.read<Push>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            alignment: Alignment.centerLeft,
            child: Text(
              push.title,
              style: const TextStyle(fontSize: 17),
            ),
          ),
          const SizedBox(height: 10),
          FittedBox(
            alignment: Alignment.centerLeft,
            child: Text(push.message),
          ),
        ],
      ),
    );
  }
}
