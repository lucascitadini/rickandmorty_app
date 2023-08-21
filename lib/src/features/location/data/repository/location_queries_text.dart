class LocationQueriesText {
  static String get locationsQueryString {
    return '''
      query getLocations(\$page: Int!) {
        locations(page: \$page) {
          info {
            count
            pages
            next
          }
          results {
            id
            name
            type
            dimension
          }
        }
      }
    ''';
  }

  static String get locationById {
    return '''
      query getLocationById(\$id: ID!) {
        location(id: \$id) {
          id
          name
          type
          dimension
          created
          residents {
            name
            image
            status
            species
            gender
            created
          }
        }
      }
    ''';
  }
}