import 'package:rickandmorty_app/src/core/widgets/rickandmorty_appbar.dart';
import 'package:rickandmorty_app/src/core/widgets/general_error_widget.dart';
import 'package:rickandmorty_app/src/core/widgets/sidebar_drawer.dart';
import 'package:rickandmorty_app/src/core/widgets/loading_widget.dart';
import 'package:rickandmorty_app/src/features/location/presentation/bloc/location_bloc.dart';
import 'package:rickandmorty_app/src/features/location/presentation/ui/widgets/location_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class LocationsScreen extends StatefulWidget {
  const LocationsScreen({super.key});

  @override
  State<LocationsScreen> createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  final _scrollController = ScrollController();
  late final LocationBloc _locationBloc;

  @override
  void initState() {
    super.initState();
    _locationBloc = context.read<LocationBloc>();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    final locationPageState = _locationBloc.state as LocationPageState;
    if (locationPageState is SuccessfulLocationPageState &&
        locationPageState.hasNextPage) {
      if (_isBottom) {
        _locationBloc.add(
          GetDataOnLocationEvent(
            page: locationPageState.info.next,
          ),
        );
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) {
      return false;
    }
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _retryLoading() {
    if (_locationBloc.state is LocationPageState) {
      _locationBloc.add(
        GetDataOnLocationEvent(
          page: (_locationBloc.state as LocationPageState).info.next,
        ),
      );
    } else {
      _locationBloc.add(const GetDataOnLocationEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: RickandmortyAppbar(title: 'Locations List'),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          return switch (state) {
            UnSuccessfulLocationState() => GeneralErrorWidget(
                retryCallback: _retryLoading,
                title: state.errorMessage,
              ),
            InitialLocationState() ||
            LoadingLocationState() =>
              const LoadingWidget(),
            LocationPageState() => _successfulWidget(state),
          };
        },
      ),
    );
  }

  Widget _successfulWidget(LocationPageState state) {
    return ListView.builder(
      cacheExtent: double.maxFinite,
      controller: _scrollController,
      itemCount: state.hasNextPage
          ? state.locations.length + 1
          : state.locations.length,
      itemBuilder: (context, index) {
        if (index == state.locations.length) {
          if (state is LoadingLocationPageState) {
            return const LoadingWidget();
          } else if (state is UnSuccessfulLocationPageState) {
            return GeneralErrorWidget(
              retryCallback: _retryLoading,
              title: state.errorMessage,
              isPaginationError: true,
            );
          }
        } else {
          return LocationWidget(location: state.locations[index]);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
