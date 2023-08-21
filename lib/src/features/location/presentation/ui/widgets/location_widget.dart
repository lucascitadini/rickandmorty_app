import 'package:rickandmorty_app/src/core/routes/rickandmorty_named_routes.dart';
import 'package:rickandmorty_app/src/core/widgets/card_widget.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  final Location location;
  const LocationWidget({
    required this.location,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: CardWidget(
        title: location.name,
        subTitle: 'Type: ${location.type} | Dimention: ${location.dimension}',
        onTap: () => Navigator.of(context).pushNamed(
          RickandmortyNamedRoutes.locationByIdPage,
          arguments: location.id,
        ),
      ),
    );
  }
}
