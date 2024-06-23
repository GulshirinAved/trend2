// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:trend_marketplace2/blocs/carts/checkOutSelectionCard/check_out_selection_bloc.dart';
import 'package:trend_marketplace2/blocs/carts/dateSelection/date_selection_dropdown_bloc.dart';
import 'package:trend_marketplace2/blocs/carts/selectAddressExpansion/select_address_expansion_bloc.dart';
import 'package:trend_marketplace2/blocs/carts/selectPayMethod/select_pay_method_bloc.dart';
import 'package:trend_marketplace2/blocs/profile/selectAddress/select_address_bloc.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/button.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/components/addressInfo_side.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/components/checkoutSelection_card.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/components/paymentOption_side.dart';

class ProductCheckOut extends StatelessWidget {
  final TextEditingController addressController;
  final TextEditingController fullAddressController;

  const ProductCheckOut({
    required this.addressController,
    required this.fullAddressController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CheckOutSelectionBloc(),
        ),
        BlocProvider(
          create: (context) => SelectAddressExpansionBloc(),
        ),
        BlocProvider(
          create: (context) => SelectPayMethodBloc(),
        ),
        BlocProvider(
          create: (context) => DateSelectionDropdownBloc(),
        ),
        BlocProvider(
          create: (context) => SelectAddressBloc(),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar.leadingWithTitle('Product checkout'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                //selectioncard for checkout
                Container(
                  height: 67.h,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return BlocBuilder<CheckOutSelectionBloc,
                          CheckOutSelectionState>(
                        builder: (context, state) {
                          return SelectionCardCheckout(
                            index: index,
                            color: state.selectedIndex == index
                                ? AppColors.whiteColor
                                : AppColors.lightGreyColor,
                          );
                        },
                      );
                    },
                  ),
                ),
                BlocBuilder<CheckOutSelectionBloc, CheckOutSelectionState>(
                  builder: (context, state) {
                    ///delivery address
                    return state.selectedIndex == 0
                        ? AddressInfo(
                            addressController: addressController,
                            fullAddressController: fullAddressController,
                          )

                        ///cart payment
                        : const PaymentOption();
                  },
                ),
                SizedBox(
                  height: 15.h,
                ),

                /// payment method button
                Button(
                  onTap: () {},
                  title: 'Payment method',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
