import 'package:rickandmorty_app/src/core/widgets/rickandmorty_appbar.dart';
import 'package:rickandmorty_app/src/core/widgets/general_error_widget.dart';
import 'package:rickandmorty_app/src/core/widgets/sidebar_drawer.dart';
import 'package:rickandmorty_app/src/features/character/presentation/bloc/character_bloc.dart';
import 'package:rickandmorty_app/src/core/widgets/loading_widget.dart';
import 'package:rickandmorty_app/src/features/character/presentation/ui/widgets/character_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final _scrollController = ScrollController();
  late final CharacterBloc _characterBloc;

  @override
  void initState() {
    super.initState();
    _characterBloc = context.read<CharacterBloc>();
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
    final characterPageState = _characterBloc.state as CharacterPageState;
    if (characterPageState is SuccessfulCharacterPageState &&
        characterPageState.hasNextPage) {
      if (_isBottom) {
        _characterBloc.add(
          GetDataOnCharacterEvent(
            urlPage: characterPageState.info.next,
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
    if (_characterBloc.state is CharacterPageState) {
      _characterBloc.add(
        GetDataOnCharacterEvent(
          urlPage: (_characterBloc.state as CharacterPageState).info.next,
        ),
      );
    } else {
      _characterBloc.add(
        const GetDataOnCharacterEvent(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: RickandmortyAppbar(title: 'Characters List'),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (blocContext, state) {
          return switch (state) {
            UnSuccessfulCharacterState() => GeneralErrorWidget(
                retryCallback: _retryLoading,
                title: state.errorMessage,
              ),
            InitialCharacterState() ||
            LoadingCharacterState() =>
              const LoadingWidget(),
            CharacterPageState() => _successfulWidget(state),
          };
        },
      ),
    );
  }

  Widget _successfulWidget(
    CharacterPageState state,
  ) {
    return ListView.builder(
      cacheExtent: double.maxFinite,
      controller: _scrollController,
      itemCount: state.hasNextPage
          ? state.characters.length + 1
          : state.characters.length,
      itemBuilder: (context, index) {
        if (index == state.characters.length) {
          if (state is LoadingCharacterPageState) {
            return const LoadingWidget();
          } else if (state is UnSuccessfulCharacterPageState) {
            return GeneralErrorWidget(
              retryCallback: _retryLoading,
              title: state.errorMessage,
              isPaginationError: true,
            );
          }
        } else {
          return CharacterWidget(character: state.characters[index]);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
