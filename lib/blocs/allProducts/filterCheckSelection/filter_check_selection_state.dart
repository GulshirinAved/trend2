// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_check_selection_bloc.dart';

class FilterCheckSelectionState extends Equatable {
  final List<String> brandList;
  final List<String> genderList;
  final List<String> storeList;
  final List<String> colorList;
  final List<String> categoryList;
  final List<String> sizeList;
  final List<String> materialList;
  final List<String> patternList;
  final bool? isGlobal;
  const FilterCheckSelectionState(
      {required this.brandList,
      required this.genderList,
      required this.storeList,
      required this.colorList,
      required this.categoryList,
      required this.sizeList,
      required this.materialList,
      required this.patternList,
      required this.isGlobal});

  @override
  List<Object> get props => [
        brandList,
        genderList,
        storeList,
        colorList,
        categoryList,
        sizeList,
        materialList,
        patternList,
        isGlobal ?? false
      ];

  FilterCheckSelectionState copyWith(
      {List<String>? brandList,
      List<String>? genderList,
      List<String>? storeList,
      List<String>? colorList,
      List<String>? categoryList,
      List<String>? sizeList,
      List<String>? materialList,
      List<String>? patternList,
      bool? isGlobal}) {
    return FilterCheckSelectionState(
      brandList: brandList ?? this.brandList,
      genderList: genderList ?? this.genderList,
      storeList: storeList ?? this.storeList,
      colorList: colorList ?? this.colorList,
      categoryList: categoryList ?? this.categoryList,
      sizeList: sizeList ?? this.sizeList,
      materialList: materialList ?? this.materialList,
      patternList: patternList ?? this.patternList,
      isGlobal: isGlobal ?? this.isGlobal,
    );
  }
}
