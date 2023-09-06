import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tech_task/app/env/env.dart';
import 'package:flutter_tech_task/core/utils/observers/custom_bloc_observer.dart';
import 'package:flutter_tech_task/locator.dart';
import 'package:hive_flutter/adapters.dart';

abstract final class AppInitializer {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Initialize Bloc Observer
    Bloc.observer = CustomBlocObserver();

    // Set Screen Orientation
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    // Initialize Hive
    await Hive.initFlutter();
    // Initialize Locator
    await Locator.locateServices(baseUrl: Env.baseUrl);
    // Initialize Localization
  }
}
