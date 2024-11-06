import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pushed_messaging/flutter_pushed_messaging.dart';
import 'package:provider/provider.dart';
import 'package:push_mvp_app/src/features/push/data/models/push.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/in_app_push/in_app_push_bloc.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/in_app_push/in_app_push_event.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/in_app_push/in_app_push_state.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/push/push_bloc.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/push/push_state.dart';
import 'package:push_mvp_app/src/features/push/presentation/widgets/in_app_push_widget.dart';
import 'package:push_mvp_app/src/features/push/presentation/widgets/push_card.dart';
import 'package:push_mvp_app/src/injection_container.dart';

class PushListWidget extends StatelessWidget {
  const PushListWidget();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Push List',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const SafeArea(
          minimum: EdgeInsets.all(16.0),
          child: _Body(),
        ),
      );
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) => BlocBuilder<PushBloc, PushState>(
        builder: (_, state) {
          if (state is PushLoadingState) {
            return const CircularProgressIndicator();
          } else {
            return Provider.value(
              value: state.pushes,
              child: const _DataList(),
            );
          }
        },
      );
}

class _DataList extends StatelessWidget {
  const _DataList();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(height: 20, child: Text('Token: ${FlutterPushedMessaging.token ?? ''}')),
          StreamBuilder(
            stream: FlutterPushedMessaging.onStatus(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 20,
                  child: Text('Status: ${snapshot.data?.name ?? ServiceStatus.notActive.name}'),
                );
              }

              return const SizedBox.shrink();
            },
          ),
          BlocListener<InAppPushBloc, InAppPushState>(
            bloc: injectionContainer(),
            listener: (context, state) {
              if (state is HasPushState) {
                showDialog(
                  context: context,
                  builder: (context) => Provider.value(value: state, child: InAppPushWidget()),
                ).then((_) => injectionContainer.get<InAppPushBloc>().add(HidePushEvent()));
              }
            },
            child: const SizedBox.shrink(),
          ),
          const _PushList(),
        ],
      );
}

class _PushList extends StatelessWidget {
  const _PushList();

  @override
  Widget build(BuildContext context) {
    final pushes = context.read<List<Push>>().reversed.toList();
    return Expanded(
      child: ListView.builder(
        itemCount: pushes.length,
        itemBuilder: (_, idx) => Provider.value(
          value: pushes[idx],
          child: PushCard(
            key: ValueKey(idx),
          ),
        ),
      ),
    );
  }
}
