// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'banner_scrolling_bloc.dart';

class BannerScrollingState extends Equatable {
  final int selectedIndex;

  const BannerScrollingState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];

  BannerScrollingState copyWith({
    int? selectedIndex,
  }) {
    return BannerScrollingState(
      selectedIndex ?? this.selectedIndex,
    );
  }
}
