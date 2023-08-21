import 'package:rickandmorty_app/src/features/location/data/models/location_detail.dart';
import 'package:rickandmorty_app/src/features/location/data/models/location_list.dart';

abstract class LocationsRepository {
  Future<LocationList> getLocations({int page = 1});
  Future<LocationDetail> getLocationById({required String id});
}
