import 'package:rickandmorty_app/src/core/routes/rickandmorty_named_routes.dart';
import 'package:rickandmorty_app/src/core/utils/assets_images.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  void _navigatorPage(BuildContext context, String namedRoute) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute == namedRoute) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushNamed(namedRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const Image(image: AssetImage(AssetsImages.sidebarImage)),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Characters'),
            onTap: () =>
                _navigatorPage(context, RickandmortyNamedRoutes.charactersPage),
          ),
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Locations'),
            onTap: () =>
                _navigatorPage(context, RickandmortyNamedRoutes.locationsPage),
          ),
        ],
      ),
    );
  }
}
