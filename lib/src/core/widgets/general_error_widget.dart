import 'package:rickandmorty_app/src/core/theme/enums/theme_type.dart';
import 'package:rickandmorty_app/src/core/theme/theme_styles.dart';
import 'package:rickandmorty_app/src/core/utils/assets_images.dart';
import 'package:flutter/material.dart';

class GeneralErrorWidget extends StatelessWidget {
  final String title;
  final bool isPaginationError;
  final VoidCallback? retryCallback;
  final String? subTitle;
  final String? buttonText;

  const GeneralErrorWidget({
    required this.title,
    this.isPaginationError = false,
    this.retryCallback,
    this.subTitle,
    this.buttonText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Center(
            child: Column(
              children: [
                if (!isPaginationError) ...[
                  const Image(image: AssetImage(AssetsImages.uiStateError)),
                  const SizedBox(
                    height: 12,
                  ),
                ],
                FittedBox(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700,),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                subTitle != null
                    ? Text(
                        subTitle!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        if (retryCallback != null) ...[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ThemeStyles.backgroundColor(
                context: context,
                type: ThemeType.error,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              retryCallback!();
            },
            child: Text(
              buttonText ?? 'Try Again',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: ThemeStyles.textColor(
                  context: context,
                  type: ThemeType.error,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ]
      ],
    );
  }
}
