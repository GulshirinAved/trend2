// ignore_for_file: public_member_api_docs, sort_constructors_first
class FavItem {
  final int id;
  final String image;
  final int? discount;
  final int price;
  final int? previousPrice;
  final String brand;
  final String desc;
  final String starRating;
  bool? isFavorite;

  FavItem({
    required this.id,
    required this.image,
    this.discount,
    required this.price,
    this.previousPrice,
    required this.brand,
    required this.desc,
    required this.starRating,
    this.isFavorite = false,
  });

  FavItem copyWith({
    int? id,
    String? image,
    int? discount,
    int? price,
    int? previousPrice,
    String? brand,
    String? desc,
    String? starRating,
    bool? isFavorite,
  }) {
    return FavItem(
      id: id ?? this.id,
      image: image ?? this.image,
      discount: discount ?? this.discount,
      price: price ?? this.price,
      previousPrice: previousPrice ?? this.previousPrice,
      brand: brand ?? this.brand,
      desc: desc ?? this.desc,
      starRating: starRating ?? this.starRating,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  bool operator ==(covariant FavItem other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.image == image &&
        other.discount == discount &&
        other.price == price &&
        other.previousPrice == previousPrice &&
        other.brand == brand &&
        other.desc == desc &&
        other.starRating == starRating &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        discount.hashCode ^
        price.hashCode ^
        previousPrice.hashCode ^
        brand.hashCode ^
        desc.hashCode ^
        starRating.hashCode ^
        isFavorite.hashCode;
  }
}
