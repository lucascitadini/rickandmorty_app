import 'package:rickandmorty_app/src/core/widgets/card_widget.dart';
import 'package:rickandmorty_app/src/features/character/data/models/character.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  const CharacterWidget({
    required this.character,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(8),
      child: CardWidget(
        imageUrl: character.image,
        subTitle: 'Specie: ${character.species} | ${character.status}',
        moreInfo: character.gender,
        title: character.name,
        date: character.created,
      ),
    );
  }
}
