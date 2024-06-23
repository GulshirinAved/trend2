// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'address_region_select_bloc.dart';

abstract class AddressSelectState extends Equatable {
  final String? selectedRegion;
  final String? selectedDistrict;
  final String? selectedVillage;
  final String? address;
  final String? fullAddress;

  const AddressSelectState({
    required this.selectedRegion,
    required this.selectedDistrict,
    required this.selectedVillage,
    this.address,
    this.fullAddress,
  });

  @override
  List<Object?> get props =>
      [selectedRegion, selectedDistrict, selectedVillage, address, fullAddress];
}

class InitialSelectState extends AddressSelectState {
  const InitialSelectState({
    required super.selectedRegion,
    required super.selectedDistrict,
    required super.selectedVillage,
    required super.address,
    required super.fullAddress,
  });
}

class RegionSelectState extends AddressSelectState {
  const RegionSelectState({
    required super.selectedRegion,
    required super.selectedDistrict,
    required super.selectedVillage,
  });
}

class DistrictSelectState extends AddressSelectState {
  const DistrictSelectState({
    required super.selectedRegion,
    required super.selectedDistrict,
    required super.selectedVillage,
  });
}

class VillageSelectState extends AddressSelectState {
  const VillageSelectState({
    required super.selectedRegion,
    required super.selectedDistrict,
    required super.selectedVillage,
  });
}

class SaveAddressState extends AddressSelectState {
  const SaveAddressState({
    super.selectedRegion,
    super.selectedDistrict,
    super.selectedVillage,
    super.address,
    super.fullAddress,
  });
}
