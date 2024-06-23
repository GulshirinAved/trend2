// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trend_marketplace2/blocs/carts/selectRegion/address_region_select_bloc.dart';

import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/data/api_providers/address_provider.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_radioButton.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/components/customTextField_dropDown.dart';
import 'package:trend_marketplace2/presentation/Screens/login/components/custom_textField.dart';

class AddressSelectCard extends StatelessWidget {
  final int index;
  final String radioTitle;
  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;
  final TextEditingController addressController;
  final TextEditingController fullAddressController;
  const AddressSelectCard({
    Key? key,
    required this.index,
    required this.radioTitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.addressController,
    required this.fullAddressController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List addressList = AddressProvider().fetchAddresses();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomRadioButton(
                title: radioTitle,
                value: value,
                groupValue: groupValue,
                fontWeight: FontWeight.w600,
                onChanged: onChanged,
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(8.0)),
                  ),
                  builder: (context) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Add address',
                              style: TextStyle(
                                color: AppColors.black1Color,
                                fontWeight: FontWeight.w600,
                                fontSize: AppFonts.font18,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: AppColors.grey19Color),
                                  color: AppColors.whiteColor,
                                ),
                                child: Icon(
                                  CupertinoIcons.clear,
                                  color: AppColors.black1Color,
                                  size: 15,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //region and district dropdown
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  locationBoldIcon,
                                ),
                                Row(
                                  children: [
                                    BlocBuilder<AddressSelectBloc,
                                        AddressSelectState>(
                                      builder: (context, state) {
                                        return CustomDropDown(
                                          hintText: 'Region',
                                          width: 138,
                                          items: regions,
                                          dropDownValue: state.selectedRegion,
                                          onChanged: (value) {
                                            context
                                                .read<AddressSelectBloc>()
                                                .add(
                                                  RegionSelectEvent(
                                                    region: value!,
                                                  ),
                                                );
                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    BlocBuilder<AddressSelectBloc,
                                        AddressSelectState>(
                                      builder: (context, state) {
                                        return CustomDropDown(
                                          hintText: 'District',
                                          width: 138,
                                          dropDownValue: state.selectedDistrict,
                                          items: districts
                                              .where(
                                                (element) =>
                                                    element.regionId
                                                        .toString() ==
                                                    state.selectedRegion,
                                              )
                                              .toList(),
                                          onChanged: (value) {
                                            context
                                                .read<AddressSelectBloc>()
                                                .add(
                                                  DistrictSelectEvent(
                                                    district: value!,
                                                  ),
                                                );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            //village dropdown
                            BlocBuilder<AddressSelectBloc, AddressSelectState>(
                              builder: (context, state) {
                                return Padding(
                                  padding:
                                      EdgeInsets.only(left: 32.w, top: 5.h),
                                  child: CustomDropDown(
                                    hintText: 'Village',
                                    dropDownValue: state.selectedVillage,
                                    width: MediaQuery.of(context).size.width,
                                    items: villages
                                        .where(
                                          (element) =>
                                              element.regionId.toString() ==
                                              state.selectedRegion,
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      context.read<AddressSelectBloc>().add(
                                          VillageSelectEvent(village: value!));
                                    },
                                  ),
                                );
                              },
                            ),
                            //adress textfield
                            Padding(
                              padding: EdgeInsets.only(left: 32.w, top: 5.h),
                              child: CustomTextField.normal(
                                controller: addressController,
                                borderColor: AppColors.grey18Color,
                                hintText: 'Address',
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ),
                            //full adress textfield
                            Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    buildingIcon,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: CustomTextField.normal(
                                      controller: fullAddressController,
                                      hintText: 'Full Address',
                                      borderColor: AppColors.grey18Color,
                                      validator: (value) {
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            BlocBuilder<AddressSelectBloc, AddressSelectState>(
                              builder: (context, state) {
                                return Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Button(
                                    onTap: () {
                                      context.read<AddressSelectBloc>().add(
                                            SaveAdressEvent(
                                              region: state.selectedRegion!,
                                              district: state.selectedDistrict!,
                                              village: state.selectedVillage!,
                                              address: addressController.text,
                                              fullAddress:
                                                  fullAddressController.text,
                                              phoneNumber: '',
                                              addressList: [
                                                {
                                                  'region':
                                                      state.selectedRegion!,
                                                  'district':
                                                      state.selectedDistrict!,
                                                  'village':
                                                      state.selectedVillage!,
                                                  'address':
                                                      addressController.text,
                                                  'fullAddress':
                                                      fullAddressController
                                                          .text,
                                                  'phoneNumber': '',
                                                }
                                              ],
                                            ),
                                          );
                                    },
                                    title: 'Save',
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Edit',
                style: TextStyle(
                  color: AppColors.darkGrey1Color,
                  fontSize: AppFonts.font12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(15).r,
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.borderRadius4,
            border: Border.all(
              color: index == int.parse(groupValue)
                  ? AppColors.blueColor
                  : AppColors.grey19Color,
            ),
            color: index == int.parse(groupValue)
                ? AppColors.blueColor.withOpacity(0.15)
                : AppColors.whiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 10.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const IconWithText(
                      icon: userBoldIcon,
                      text: 'Take and ship',
                    ),
                    IconWithText(
                      icon: call1Icon,
                      text: addressList[index]['phoneNumber'],
                    ),
                  ],
                ),
              ),
              Text(
                addressList[index]['fullAddress'],
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontWeight: FontWeight.w400,
                  fontSize: AppFonts.font10,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '${regions[int.parse('${addressList[index]['district']}')].name}/ Turkmenistan',
                style: TextStyle(
                  color: AppColors.darkGrey1Color,
                  fontWeight: FontWeight.w400,
                  fontSize: AppFonts.font10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IconWithText extends StatelessWidget {
  final String icon;
  final String text;
  const IconWithText({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 14.h,
          fit: BoxFit.scaleDown,
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColors.darkGrey1Color,
            fontWeight: FontWeight.w600,
            fontSize: AppFonts.font10,
          ),
        ),
      ],
    );
  }
}
