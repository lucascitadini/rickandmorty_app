import 'package:cached_network_image/cached_network_image.dart';
import 'package:rickandmorty_app/src/core/utils/assets_images.dart';
import 'package:rickandmorty_app/src/core/utils/date_formatter.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String subTitle;
  final String? moreInfo;
  final String? date;
  final VoidCallback? onTap;

  const CardWidget({
    required this.subTitle,
    required this.title,
    Key? key,
    this.imageUrl,
    this.date,
    this.moreInfo,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ListTile(
            leading: imageUrl != null
                ? CachedNetworkImage(
                    imageUrl: imageUrl!,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Image(
                        image: AssetImage(AssetsImages.uiStateError),),
                  )
                : null,
            title: Text(title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subTitle),
                if (moreInfo != null) Text(moreInfo!),
              ],
            ),
            isThreeLine: moreInfo != null,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            onTap: onTap,
          ),
          if (date != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8, right: 16),
              child: Text(
                  'Created: ${DateFormatter.convertStringDatePatterns(date: date!)}',),
            )
        ],
      ),
    );
  }
}
