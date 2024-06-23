import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'address_region_select_event.dart';
part 'address_region_select_state.dart';

class AddressSelectBloc extends Bloc<AddressSelectEvent, AddressSelectState> {
  AddressSelectBloc()
      : super(
          const InitialSelectState(
            selectedRegion: null,
            selectedDistrict: null,
            selectedVillage: null,
            address: null,
            fullAddress: null,
          ),
        ) {
    on<RegionSelectEvent>((event, emit) {
      emit(
        RegionSelectState(
          selectedRegion: event.region,
          selectedDistrict: null,
          selectedVillage: null,
        ),
      );
    });

    on<DistrictSelectEvent>((event, emit) {
      emit(
        DistrictSelectState(
          selectedDistrict: event.district,
          selectedRegion: state.selectedRegion,
          selectedVillage: null,
        ),
      );
    });

    on<VillageSelectEvent>((event, emit) {
      emit(
        VillageSelectState(
          selectedVillage: event.village,
          selectedDistrict: state.selectedDistrict,
          selectedRegion: state.selectedRegion,
        ),
      );
    });
    on<SaveAdressEvent>((event, emit) async {
      final Box addressBox = await Hive.openBox('addressBox');
      final List currentAddresses =
          addressBox.get('addressBox', defaultValue: []);
      currentAddresses.addAll(event.addressList);
      await addressBox.put('addressBox', currentAddresses);
      emit(
        SaveAddressState(
          selectedVillage: state.selectedVillage,
          selectedDistrict: state.selectedDistrict,
          selectedRegion: state.selectedRegion,
          address: event.address,
          fullAddress: event.fullAddress,
        ),
      );
    });
  }
}
