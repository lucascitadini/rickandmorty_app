part of 'rickandmorty_appbar.dart';

class _RickandmortyAppbarChild extends StatelessWidget {
  final String title;
  final Widget? leading;

  const _RickandmortyAppbarChild({
    required this.title,
    Key? key,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: leading,
    );
  }
}
