import 'package:rickandmorty_app/src/core/widgets/rickandmorty_appbar.dart';
import 'package:rickandmorty_app/src/core/widgets/general_error_widget.dart';
import 'package:rickandmorty_app/src/core/widgets/loading_widget.dart';
import 'package:rickandmorty_app/src/features/location/presentation/bloc/location_detail_bloc.dart';
import 'package:rickandmorty_app/src/features/location/presentation/ui/widgets/location_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class LocationDetailScreen extends StatefulWidget {
  final String id;

  const LocationDetailScreen({required this.id, Key? key}) : super(key: key);

  @override
  State<LocationDetailScreen> createState() => _LocationDetailScreenState();
}

class _LocationDetailScreenState extends State<LocationDetailScreen> {
  late final LocationDetailBloc _locationDetailBloc;

  @override
  void initState() {
    super.initState();
    _locationDetailBloc = context.read<LocationDetailBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RickandmortyAppbar(
        title: 'Location Detail',
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<LocationDetailBloc, LocationDetailState>(
        builder: (context, state) {
          return switch (state) {
            UnSuccessfulLocationDetailState() => GeneralErrorWidget(
                retryCallback: () => _locationDetailBloc
                    .add(GetDataOnLocationDetailEvent(widget.id)),
                title: state.errorMessage,
              ),
            InitialLocationDetailState() ||
            LoadingLocationDetailState() =>
              const LoadingWidget(),
            SuccessfulLocationDetailState() =>
              LocationDetailWidget(locationDetail: state.location),
          };
        },
      ),
    );
  }
}
