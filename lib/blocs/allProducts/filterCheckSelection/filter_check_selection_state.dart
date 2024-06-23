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
  final List<String> globalBrandList;
  final List<String> globalGenderList;
  final List<String> globalStoreList;
  final List<String> globalColorList;
  final List<String> globalCategoryList;
  final List<String> globalSizeList;
  final List<String> globalMaterialList;
  final List<String> globalPatternList;
  final bool isGlobal;

  const FilterCheckSelectionState({
    required this.brandList,
    required this.genderList,
    required this.storeList,
    required this.colorList,
    required this.categoryList,
    required this.sizeList,
    required this.materialList,
    required this.patternList,
    required this.globalBrandList,
    required this.globalGenderList,
    required this.globalStoreList,
    required this.globalColorList,
    required this.globalCategoryList,
    required this.globalSizeList,
    required this.globalMaterialList,
    required this.globalPatternList,
    required this.isGlobal,
  });

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
        globalBrandList,
        globalGenderList,
        globalStoreList,
        globalColorList,
        globalCategoryList,
        globalSizeList,
        globalMaterialList,
        globalPatternList,
        isGlobal,
      ];

  FilterCheckSelectionState copyWith({
    List<String>? brandList,
    List<String>? genderList,
    List<String>? storeList,
    List<String>? colorList,
    List<String>? categoryList,
    List<String>? sizeList,
    List<String>? materialList,
    List<String>? patternList,
    List<String>? globalBrandList,
    List<String>? globalGenderList,
    List<String>? globalStoreList,
    List<String>? globalColorList,
    List<String>? globalCategoryList,
    List<String>? globalSizeList,
    List<String>? globalMaterialList,
    List<String>? globalPatternList,
    bool? isGlobal,
  }) {
    return FilterCheckSelectionState(
      brandList: brandList ?? this.brandList,
      genderList: genderList ?? this.genderList,
      storeList: storeList ?? this.storeList,
      colorList: colorList ?? this.colorList,
      categoryList: categoryList ?? this.categoryList,
      sizeList: sizeList ?? this.sizeList,
      materialList: materialList ?? this.materialList,
      patternList: patternList ?? this.patternList,
      globalBrandList: globalBrandList ?? this.globalBrandList,
      globalGenderList: globalGenderList ?? this.globalGenderList,
      globalStoreList: globalStoreList ?? this.globalStoreList,
      globalColorList: globalColorList ?? this.globalColorList,
      globalCategoryList: globalCategoryList ?? this.globalCategoryList,
      globalSizeList: globalSizeList ?? this.globalSizeList,
      globalMaterialList: globalMaterialList ?? this.globalMaterialList,
      globalPatternList: globalPatternList ?? this.globalPatternList,
      isGlobal: isGlobal ?? this.isGlobal,
    );
  }
}
