part of 'select_address_bloc.dart';

class SelectAddressEvent extends Equatable {
  final int selectedIndex;
  const SelectAddressEvent({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}
