part of 'address_region_select_bloc.dart';

abstract class AddressSelectEvent extends Equatable {
  const AddressSelectEvent();

  @override
  List<Object> get props => [];
}

class RegionSelectEvent extends AddressSelectEvent {
  final String region;

  const RegionSelectEvent({required this.region});

  @override
  List<Object> get props => [region];
}

class DistrictSelectEvent extends AddressSelectEvent {
  final String district;

  const DistrictSelectEvent({required this.district});

  @override
  List<Object> get props => [district];
}

class VillageSelectEvent extends AddressSelectEvent {
  final String village;

  const VillageSelectEvent({required this.village});

  @override
  List<Object> get props => [village];
}

class SaveAdressEvent extends AddressSelectEvent {
  List<Map<String, dynamic>> addressList;
  final String region;
  final String district;
  final String village;
  final String address;
  final String fullAddress;
  final String phoneNumber;

  SaveAdressEvent(
      {required this.region,
      required this.district,
      required this.village,
      required this.address,
      required this.fullAddress,
      required this.phoneNumber,
      required this.addressList});

  @override
  List<Object> get props => [
        region,
        district,
        village,
        address,
        fullAddress,
        phoneNumber,
        addressList
      ];
}
