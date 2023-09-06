import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/app/initializer/app_initializer.dart';
import 'package:flutter_tech_task/app/router/app_router.dart';
import 'package:flutter_tech_task/app/router/custom_route_observer.dart';
import 'package:flutter_tech_task/feature/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:flutter_tech_task/locator.dart';

Future<void> main() async {
  await AppInitializer.initialize();

  runApp(FlutterTechTask());
}

class FlutterTechTask extends StatelessWidget {
  FlutterTechTask({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoritesCubit>(
      create: (context) => Locator.favoritesCubit..getFavorites(),
      child: MaterialApp.router(
        title: 'Flutter Tech Task',
        debugShowCheckedModeBanner: false,

        // Theme
        theme: ThemeData(
          colorSchemeSeed: Colors.orange,
          useMaterial3: true,
        ),

        // Routing
        routerConfig: _appRouter.config(
          navigatorObservers: () => [CustomRouteObserver()],
        ),
      ),
    );
  }
}
