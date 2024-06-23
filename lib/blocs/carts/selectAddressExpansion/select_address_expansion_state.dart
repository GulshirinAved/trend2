// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'select_address_expansion_bloc.dart';

class SelectAddressExpansionState extends Equatable {
  final bool isExpanded;
  const SelectAddressExpansionState({required this.isExpanded});

  @override
  List<Object> get props => [isExpanded];

  SelectAddressExpansionState copyWith({
    bool? isExpanded,
  }) {
    return SelectAddressExpansionState(
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
