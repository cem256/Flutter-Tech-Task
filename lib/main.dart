import 'package:flutter/material.dart';
import 'package:flutter_tech_task/app/router/app_router.dart';
import 'package:flutter_tech_task/app/router/custom_route_observer.dart';

void main() {
  runApp(FlutterTechTask());
}

class FlutterTechTask extends StatelessWidget {
  FlutterTechTask({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Tech Task',
      debugShowCheckedModeBanner: false,

      // Theme
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),

      // Routing
      routerConfig: _appRouter.config(
        navigatorObservers: () => [CustomRouteObserver()],
      ),
    );
  }
}
