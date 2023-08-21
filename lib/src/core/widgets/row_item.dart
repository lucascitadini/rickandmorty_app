import 'package:rickandmorty_app/src/core/theme/enums/theme_type.dart';
import 'package:rickandmorty_app/src/core/theme/theme_styles.dart';
import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  final String title;
  final String description;
  final ThemeType themeType;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  const RowItem({
    required this.title,
    required this.description,
    this.themeType = ThemeType.background,
    Key? key,
    this.titleStyle,
    this.descriptionStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              title,
              style: titleStyle ??
                  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: ThemeStyles.textColor(
                        context: context, type: themeType,),
                  ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              description,
              style: descriptionStyle ??
                  TextStyle(
                    fontSize: 16,
                    color: ThemeStyles.textColor(
                        context: context, type: themeType,),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
