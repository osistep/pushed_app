import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_mvp_app/src/config/routes.dart';
import 'package:push_mvp_app/src/config/theme.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/push/push_bloc.dart';
import 'package:push_mvp_app/src/features/push/presentation/bloc/push/push_event.dart';
import 'package:push_mvp_app/src/features/push/presentation/widgets/push_list_widget.dart';
import 'package:push_mvp_app/src/injection_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: injectionContainer.getAsync<PushBloc>(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BlocProvider<PushBloc>(
              create: (context) => snapshot.data!..add(LoadAllPushesEvent()),
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: theme(),
                title: 'Pushes MVP app',
                onGenerateRoute: AppRoutes.onGenerateRoutes,
                home: const PushListWidget(),
              ),
            );
          }
          if (snapshot.hasError) {
            return const SizedBox.shrink();
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
