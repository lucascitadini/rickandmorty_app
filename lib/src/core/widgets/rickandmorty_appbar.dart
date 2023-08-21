import 'package:flutter/material.dart';

part 'rickandmorty_appbar_child.dart';

class RickandmortyAppbar extends PreferredSize {
  final String title;
  final Widget? leading;

  RickandmortyAppbar({required this.title, super.key, this.leading})
      : super(
          child: _RickandmortyAppbarChild(title: title, leading: leading),
          preferredSize: const Size.fromHeight(56),
        );
}
