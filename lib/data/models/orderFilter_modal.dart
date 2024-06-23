// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderFilterModal {
  final int id;
  final String name;

  OrderFilterModal({required this.id, required this.name});

  @override
  bool operator ==(covariant OrderFilterModal other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
