import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/blocs/carts/selectAddressExpansion/select_address_expansion_bloc.dart';
import 'package:trend_marketplace2/blocs/profile/selectAddress/select_address_bloc.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/api_providers/address_provider.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/components/addAdress_button.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/components/addressSelect_card.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/components/customTextField_dropDown.dart';

class AddressInfo extends StatelessWidget {
  final TextEditingController addressController;
  final TextEditingController fullAddressController;

  const AddressInfo({
    required this.addressController,
    required this.fullAddressController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15).h,
      padding: const EdgeInsets.all(15).r,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.grey16Color,
        ),
        borderRadius: AppBorderRadius.borderRadius6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //adress title add address button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery adress',
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFonts.font14,
                ),
              ),
              const AddAdressButton(),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          //selection of dropdown
          Column(
            children: [
              BlocBuilder<SelectAddressExpansionBloc,
                  SelectAddressExpansionState>(
                builder: (context, state) {
                  ///dropdown click button
                  return GestureDetector(
                    onTap: () {
                      context.read<SelectAddressExpansionBloc>().add(
                            const SelectAddressExpansionEvent(),
                          );
                    },
                    child: CustomDropDown(
                      width: double.infinity,
                      hintText: 'Select adress',
                      isBorder: true,
                      dropDownValue: null,
                      items: const [],
                      onChanged: (value) {},
                    ),
                  );
                },
              ),
              //animted container for choice
              BlocBuilder<SelectAddressExpansionBloc,
                  SelectAddressExpansionState>(
                builder: (context, state) {
                  return AnimatedSize(
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 500),
                    child: state.isExpanded == true
                        ? SizedBox(
                            height: 250.h,
                            child: ListView.builder(
                              itemCount:
                                  AddressProvider().fetchAddresses().length,
                              itemBuilder: (context, index) {
                                return BlocBuilder<SelectAddressBloc,
                                    SelectAddressState>(
                                  builder: (context, state) {
                                    return AddressSelectCard(
                                      index: index,
                                      addressController: addressController,
                                      fullAddressController:
                                          fullAddressController,
                                      radioTitle: 'TAKEANDSHIP',
                                      value: index.toString(),
                                      groupValue:
                                          state.selectedIndex.toString(),
                                      onChanged: (value) => context
                                          .read<SelectAddressBloc>()
                                          .add(
                                            SelectAddressEvent(
                                              selectedIndex: int.parse(value!),
                                            ),
                                          ),
                                    );
                                  },
                                );
                              },
                            ),
                          )
                        : const SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
