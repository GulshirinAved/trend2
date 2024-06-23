import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/blocs/carts/selectRegion/address_region_select_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/components/customTextField_dropDown.dart';
import 'package:trend_marketplace2/presentation/Screens/login/components/custom_textField.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/profileAddressInfoList_screen.dart';

class ProfileAddAddressScreen extends StatefulWidget {
  const ProfileAddAddressScreen({super.key});

  @override
  State<ProfileAddAddressScreen> createState() =>
      _ProfileAddAddressScreenState();
}

class _ProfileAddAddressScreenState extends State<ProfileAddAddressScreen> {
  late TextEditingController addressController;
  late TextEditingController fullAddressController;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController();
    fullAddressController = TextEditingController();
  }

  @override
  void dispose() {
    addressController.dispose();
    fullAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressSelectBloc(),
      child: Scaffold(
        appBar: CustomAppBar.leadingWithTitle('Address information'),
        body: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: AppBorderRadius.borderRadius8,
          ),
          padding: const EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          child: Column(
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
                      BlocBuilder<AddressSelectBloc, AddressSelectState>(
                        builder: (context, state) {
                          return CustomDropDown(
                            hintText: 'Region',
                            width: 138,
                            items: regions,
                            dropDownValue: state.selectedRegion,
                            onChanged: (value) {
                              context.read<AddressSelectBloc>().add(
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
                      BlocBuilder<AddressSelectBloc, AddressSelectState>(
                        builder: (context, state) {
                          return CustomDropDown(
                            hintText: 'District',
                            width: 138,
                            dropDownValue: state.selectedDistrict,
                            items: districts
                                .where(
                                  (element) =>
                                      element.regionId.toString() ==
                                      state.selectedRegion,
                                )
                                .toList(),
                            onChanged: (value) {
                              context.read<AddressSelectBloc>().add(
                                    DistrictSelectEvent(district: value!),
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
                    padding: EdgeInsets.only(left: 32.w, top: 5.h),
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
                        context
                            .read<AddressSelectBloc>()
                            .add(VillageSelectEvent(village: value!));
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                fullAddress: fullAddressController.text,
                                phoneNumber: '',
                                addressList: [
                                  {
                                    'region': state.selectedRegion!,
                                    'district': state.selectedDistrict!,
                                    'village': state.selectedVillage!,
                                    'address': addressController.text,
                                    'fullAddress': fullAddressController.text,
                                    'phoneNumber': '',
                                  }
                                ],
                              ),
                            );
                        pushScreenWithNavBar(
                          context,
                          ProfileAddressInfoList(
                            addressController: addressController,
                            fullAddressController: fullAddressController,
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
        ),
      ),
    );
  }
}
