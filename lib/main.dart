import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/app/env/env.dart';
import 'package:flutter_tech_task/app/router/app_router.dart';
import 'package:flutter_tech_task/app/router/custom_route_observer.dart';
import 'package:flutter_tech_task/core/utils/observers/custom_bloc_observer.dart';
import 'package:flutter_tech_task/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Bloc Observer
  Bloc.observer = CustomBlocObserver();

  // Set Screen Orientation
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  // Initialize Locator
  await Locator.locateServices(baseUrl: Env.baseUrl);

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
