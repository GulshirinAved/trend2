import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:trend_marketplace2/blocs/carts/selectRegion/address_region_select_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/components/customTExtField_dropDown.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/productCheckout_screen.dart';
import 'package:trend_marketplace2/presentation/Screens/login/components/custom_textField.dart';

class AddAdressScreen extends StatefulWidget {
  const AddAdressScreen({super.key});

  @override
  State<AddAdressScreen> createState() => _AddAdressScreenState();
}

class _AddAdressScreenState extends State<AddAdressScreen> {
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController phoneNumberController;
  late TextEditingController adressController;
  late TextEditingController fullAdressController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    surnameController = TextEditingController();
    phoneNumberController = TextEditingController();
    adressController = TextEditingController();
    fullAdressController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressSelectBloc(),
      child: Scaffold(
        appBar: CustomAppBar.leadingWithTitle('Add Address'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ///contact information////////
              Container(
                color: AppColors.whiteColor,
                margin: EdgeInsets.symmetric(vertical: 15.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact information',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: AppFonts.font12,
                      ),
                    ),
                    Divider(
                      color: AppColors.grey14Color,
                    ),
                    //name textfield
                    IconWithTextField(
                      controller: nameController,
                      isDigid: false,
                      hinText: 'Name',
                      iconName: userBoldIcon,
                    ),
                    //surname textfield
                    Padding(
                      padding: EdgeInsets.only(left: 32.w, bottom: 10.h),
                      child: CustomTextField.normal(
                        controller: surnameController,
                        hintText: 'Surname',
                        validator: (p0) {
                          return null;
                        },
                      ),
                    ),
                    //phoneNumber textfield
                    IconWithTextField(
                      isDigid: true,
                      controller: phoneNumberController,
                      hinText: 'Phone number',
                      iconName: callIcon,
                    ),
                  ],
                ),
              ),
              //adress information///////
              Container(
                color: AppColors.whiteColor,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address information',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: AppFonts.font12,
                      ),
                    ),
                    Divider(
                      color: AppColors.grey14Color,
                    ),
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
                        controller: adressController,
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
                              controller: fullAdressController,
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
                  ],
                ),
              ),
              BlocBuilder<AddressSelectBloc, AddressSelectState>(
                builder: (context, state) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                    child: Button(
                      onTap: () {
                        context.read<AddressSelectBloc>().add(
                              SaveAdressEvent(
                                region: state.selectedRegion!,
                                district: state.selectedDistrict!,
                                village: state.selectedVillage!,
                                address: adressController.text,
                                fullAddress: fullAdressController.text,
                                phoneNumber: phoneNumberController.text,
                                addressList: [
                                  {
                                    'region': state.selectedRegion!,
                                    'district': state.selectedDistrict!,
                                    'village': state.selectedVillage!,
                                    'address': adressController.text,
                                    'fullAddress': fullAdressController.text,
                                    'phoneNumber': phoneNumberController.text,
                                  }
                                ],
                              ),
                            );
                        pushScreenWithNavBar(
                            context,
                            ProductCheckOut(
                              addressController: adressController,
                              fullAddressController: fullAdressController,
                            ));
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

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    phoneNumberController.dispose();
    adressController.dispose();
    fullAdressController.dispose();
    super.dispose();
  }
}

class IconWithTextField extends StatelessWidget {
  const IconWithTextField({
    required this.controller,
    required this.hinText,
    required this.iconName,
    required this.isDigid,
    super.key,
  });

  final TextEditingController controller;
  final String? hinText;
  final String iconName;
  final bool? isDigid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          SvgPicture.asset(
            iconName,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: CustomTextField.normal(
              controller: controller,
              isDigit: isDigid,
              hintText: hinText!,
              validator: (p0) {
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
