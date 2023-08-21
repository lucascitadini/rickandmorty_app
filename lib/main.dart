import 'package:rickandmorty_app/src/core/routes/rickandmorty_named_routes.dart';
import 'package:rickandmorty_app/src/core/routes/rickandmorty_router.dart';
import 'package:rickandmorty_app/src/core/theme/color_schemes.dart';
import 'package:rickandmorty_app/src/core/injects/rickandmorty_test_inject.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RickandmortyTestAppInject.configure(GetIt.instance);
  runApp(const RickandmortyApp());
}

class RickandmortyApp extends StatelessWidget {
  const RickandmortyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorSchemes.lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorSchemes.darkColorScheme,
      ),
      initialRoute: RickandmortyNamedRoutes.charactersPage,
      onGenerateRoute: RickandmortyRouter.generateRoute,
      onUnknownRoute: RickandmortyRouter.errorRoute,
    );
  }
}
