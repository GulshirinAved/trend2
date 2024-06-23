// ignore_for_file: public_member_api_docs, sort_constructors_first
class LocationModal {
  List<Region> region;
  List<District> district;
  List<Village> village;

  LocationModal({
    required this.region,
    required this.district,
    required this.village,
  });
}

class District {
  final int id;
  final int regionId;
  final String name;

  District({required this.id, required this.regionId, required this.name});

  @override
  bool operator ==(covariant District other) {
    if (identical(this, other)) return true;

    return other.id == id && other.regionId == regionId && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ regionId.hashCode ^ name.hashCode;
}

class Region {
  final int id;
  final String name;

  Region({required this.id, required this.name});

  @override
  bool operator ==(covariant Region other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

class Village {
  final int id;
  final int regionId;
  final String name;

  Village({required this.id, required this.regionId, required this.name});

  @override
  bool operator ==(covariant Village other) {
    if (identical(this, other)) return true;

    return other.id == id && other.regionId == regionId && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ regionId.hashCode ^ name.hashCode;
}
