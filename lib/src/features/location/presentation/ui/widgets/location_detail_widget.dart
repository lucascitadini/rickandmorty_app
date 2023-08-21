import 'package:rickandmorty_app/src/core/theme/enums/theme_type.dart';
import 'package:rickandmorty_app/src/core/utils/date_formatter.dart';
import 'package:rickandmorty_app/src/core/widgets/card_widget.dart';
import 'package:rickandmorty_app/src/core/widgets/row_item.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location_detail.dart';
import 'package:flutter/material.dart';

class LocationDetailWidget extends StatelessWidget {
  final LocationDetail locationDetail;
  const LocationDetailWidget({
    required this.locationDetail,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              children: [
                Text(
                  locationDetail.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                RowItem(
                  title: 'Dimention',
                  description: locationDetail.dimension,
                  themeType: ThemeType.primary,
                ),
                const Divider(),
                RowItem(
                  title: 'Type',
                  description: locationDetail.type,
                  themeType: ThemeType.primary,
                ),
                const Divider(),
                RowItem(
                  title: 'created',
                  description: DateFormatter.convertStringDatePatterns(
                      date: locationDetail.created,),
                  themeType: ThemeType.primary,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: locationDetail.residents.isNotEmpty
                  ? Theme.of(context).colorScheme.tertiary
                  : Theme.of(context).colorScheme.secondary,
            ),
            child: Center(
              child: Text(
                locationDetail.residents.isNotEmpty
                    ? 'Residents'
                    : 'No Residents',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: locationDetail.residents.isNotEmpty
                      ? Theme.of(context).colorScheme.onTertiary
                      : Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              cacheExtent: double.maxFinite,
              itemCount: locationDetail.residents.length,
              itemBuilder: (context, index) {
                return CardWidget(
                  imageUrl: locationDetail.residents[index].image,
                  title: locationDetail.residents[index].name,
                  subTitle:
                      'Status - ${locationDetail.residents[index].status}',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
