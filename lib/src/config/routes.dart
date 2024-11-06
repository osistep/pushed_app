import 'package:flutter/material.dart';
import 'package:push_mvp_app/src/features/push/presentation/widgets/push_list_widget.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const PushListWidget());
      default:
        return _materialRoute(const PushListWidget());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
