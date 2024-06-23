// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'select_address_bloc.dart';

class SelectAddressState extends Equatable {
  final int selectedIndex;
  const SelectAddressState({
    required this.selectedIndex,
  });

  @override
  List<Object> get props => [selectedIndex];
}

final class SelectAddressInitial extends SelectAddressState {
  const SelectAddressInitial({required super.selectedIndex});
}
