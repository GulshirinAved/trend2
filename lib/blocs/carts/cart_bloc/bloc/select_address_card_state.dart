part of 'select_address_card_bloc.dart';

sealed class SelectAddressCardState extends Equatable {
  const SelectAddressCardState();
  
  @override
  List<Object> get props => [];
}

final class SelectAddressCardInitial extends SelectAddressCardState {}
