import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/in_app_push/in_app_push_state.dart';

class InAppPushWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.read<InAppPushState>();
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Text(state.pushes?.title ?? ''),
          Text(state.pushes?.message ?? ''),
          Container(
            height: size.height * 0.6,
            width: size.width * 0.8,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
