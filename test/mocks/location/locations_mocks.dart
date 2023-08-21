import 'dart:convert';

import 'package:rickandmorty_app/src/features/location/data/models/location.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location_detail.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location_list.dart';
import 'package:rickandmorty_app/src/features/location/data/models/page_info.dart';

import '../character/characters_mocks.dart';

class LocationsMocks {
  LocationsMocks._();

  static LocationDetail locationDetail = LocationDetail(
    '2',
    'Abadango',
    'Cluster',
    'unknown',
    '2017-11-10T13:06:38.182Z',
    CharactersMocks.characters,
  );

  static LocationList locationList = LocationList.fromJson(getDataResponse);

  static List<Location> locations = locationList.results;

  static List<Location> twiceLocations = [...locations, ...locations];

  static PageInfo info = locationList.info;

  static Map<String, dynamic> getDataResponse = (json.decode(getLocationsJson)
      as Map<String, dynamic>)['data'] as Map<String, dynamic>;

  static const getLocationsJson = '''{
      "data": {
          "locations": {
              "info": {
                  "count": 126,
                  "pages": 7,
                  "next": 2
              },
              "results": [
                  {
                      "id": "1",
                      "name": "Earth (C-137)",
                      "type": "Planet",
                      "dimension": "Dimension C-137"
                  }
              ]
          }
      }
  }''';
}
