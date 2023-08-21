import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:rickandmorty_app/src/core/routes/rickandmorty_named_routes.dart';
import 'package:rickandmorty_app/src/core/widgets/general_error_widget.dart';
import 'package:rickandmorty_app/src/features/character/domain/usecases/characters_usecase.dart';
import 'package:rickandmorty_app/src/features/character/presentation/bloc/character_bloc.dart';
import 'package:rickandmorty_app/src/features/character/presentation/ui/pages/character_screen.dart';
import 'package:rickandmorty_app/src/features/location/domain/usecases/locations_usecase.dart';
import 'package:rickandmorty_app/src/features/location/presentation/bloc/location_bloc.dart';
import 'package:rickandmorty_app/src/features/location/presentation/bloc/location_detail_bloc.dart';
import 'package:rickandmorty_app/src/features/location/presentation/ui/pages/location_detail_screen.dart';
import 'package:rickandmorty_app/src/features/location/presentation/ui/pages/locations_screen.dart';

sealed class RickandmortyRouter {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RickandmortyNamedRoutes.charactersPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return BlocProvider<CharacterBloc>(
              create: (context) => CharacterBloc(
                GetIt.I.get<CharactersUsecase>(),
              )..add(const GetDataOnCharacterEvent()),
              child: const CharactersScreen(),
            );
          },
        );
      case RickandmortyNamedRoutes.locationsPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return BlocProvider<LocationBloc>(
              create: (context) => LocationBloc(
                GetIt.I.get<LocationsUsecase>(),
              )..add(const GetDataOnLocationEvent()),
              child: const LocationsScreen(),
            );
          },
        );
      case RickandmortyNamedRoutes.locationByIdPage:
        final id = routeSettings.arguments! as String;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) {
            return BlocProvider<LocationDetailBloc>(
              create: (context) => LocationDetailBloc(
                GetIt.I.get<LocationsUsecase>(),
              )..add(GetDataOnLocationDetailEvent(id)),
              child: LocationDetailScreen(id: id),
            );
          },
        );
      default:
        return errorRoute(routeSettings);
    }
  }

  static Route<dynamic> errorRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => const GeneralErrorWidget(title: 'Page Not Found!'),
    );
  }
}
