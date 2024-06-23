// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trend_marketplace2/blocs/profile/selectAddress/select_address_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/api_providers/address_provider.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/components/addressSelect_card.dart';

class ProfileAddressInfoList extends StatelessWidget {
  final TextEditingController addressController;
  final TextEditingController fullAddressController;
  const ProfileAddressInfoList({
    required this.addressController,
    required this.fullAddressController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectAddressBloc(),
      child: Scaffold(
        appBar: CustomAppBar.normalWithActionIcon(
          'Address information',
          () {},
          addSquareIcon,
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: AppBorderRadius.borderRadius8,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: AddressProvider().fetchAddresses().length,
              itemBuilder: (context, index) {
                return BlocBuilder<SelectAddressBloc, SelectAddressState>(
                  builder: (context, state) {
                    return AddressSelectCard(
                      index: index,
                      addressController: addressController,
                      fullAddressController: fullAddressController,
                      radioTitle: 'TAKEANDSHIP',
                      value: index.toString(),
                      groupValue: state.selectedIndex.toString(),
                      onChanged: (value) =>
                          context.read<SelectAddressBloc>().add(
                                SelectAddressEvent(
                                  selectedIndex: int.parse(value!),
                                ),
                              ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
