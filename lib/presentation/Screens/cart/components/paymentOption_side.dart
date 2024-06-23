import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/blocs/carts/dateSelection/date_selection_dropdown_bloc.dart';
import 'package:trend_marketplace2/blocs/carts/selectPayMethod/select_pay_method_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_radioButton.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/components/customTextField_dropDown.dart';
import 'package:trend_marketplace2/presentation/Screens/login/components/custom_textField.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({
    super.key,
  });

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  late TextEditingController cardNumberController;
  late TextEditingController cvvController;
  late TextEditingController nameAndSurnameController;

  @override
  void initState() {
    super.initState();
    cardNumberController = TextEditingController();
    cvvController = TextEditingController();
    nameAndSurnameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///payment method tile
        Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment method',
                style: TextStyle(
                  color: AppColors.darkGrey1Color,
                  fontWeight: FontWeight.w600,
                  fontSize: AppFonts.font14,
                ),
              ),
              //payment selection
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    payMethod.length,
                    (index) => Expanded(
                      child: BlocBuilder<SelectPayMethodBloc,
                          SelectPayMethodState>(
                        builder: (context, state) {
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              border: Border.all(
                                color: state.selectedPayment == payMethod[index]
                                    ? AppColors.blueColor
                                    : AppColors.grey16Color,
                              ),
                              borderRadius: AppBorderRadius.borderRadius6,
                            ),
                            child: CustomRadioButton(
                              value: payMethod[index],
                              title: payMethod[index],
                              groupValue: state.selectedPayment,
                              onChanged: (value) {
                                context.read<SelectPayMethodBloc>().add(
                                      SelectPayMethodEvent(
                                        pressedValue: value.toString(),
                                      ),
                                    );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  )..insert(
                      1,
                      SizedBox(
                        width: 10.w,
                      ),
                    ),
                ),
              ),
            ],
          ),
        ),
        //card information empty
        BlocBuilder<SelectPayMethodBloc, SelectPayMethodState>(
          builder: (context, state) {
            return state.selectedPayment != ''
                ? Container(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Card Information',
                          style: TextStyle(
                            color: AppColors.darkGrey1Color,
                            fontWeight: FontWeight.w600,
                            fontSize: AppFonts.font14,
                          ),
                        ),
                        //cardnumber and cvv textfield
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: CustomTextField.normal(
                                  controller: cardNumberController,
                                  hintText: 'Card number',
                                  validator: (value) {
                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10.w),
                                  child: CustomTextField.normal(
                                    controller: cvvController,
                                    hintText: 'CVV',
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //textfield surname and name
                        CustomTextField.normal(
                          controller: nameAndSurnameController,
                          hintText: 'Name and surname',
                          validator: (value) {
                            return null;
                          },
                        ),
                        //month and year dropdown
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () => context
                                          .read<DateSelectionDropdownBloc>()
                                          .add(MonthSelectionEvent()),
                                      child: CustomDropDown(
                                        width: double.infinity,
                                        hintText: 'Month',
                                        isBorder: false,
                                        dropDownValue: null,
                                        items: const [],
                                        onChanged: (value) {},
                                      ),
                                    ),
                                    BlocBuilder<DateSelectionDropdownBloc,
                                        DateSelectionDropdownState>(
                                      builder: (context, state) {
                                        return AnimatedSize(
                                          duration: Durations.medium4,
                                          child: state.isMonthExpanded == true
                                              ? Column(
                                                  children: List.generate(
                                                    month.length,
                                                    (index) {
                                                      return Text(month[index]);
                                                    },
                                                  ),
                                                )
                                              : const SizedBox(),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () => context
                                          .read<DateSelectionDropdownBloc>()
                                          .add(YearSelectionEvent()),
                                      child: CustomDropDown(
                                        width: double.infinity,
                                        hintText: 'Year',
                                        isBorder: false,
                                        dropDownValue: null,
                                        items: const [],
                                        onChanged: (value) {},
                                      ),
                                    ),
                                    BlocBuilder<DateSelectionDropdownBloc,
                                        DateSelectionDropdownState>(
                                      builder: (context, state) {
                                        return AnimatedSize(
                                          duration: Durations.medium4,
                                          child: state.isYearExpanded == true
                                              ? Column(
                                                  children: List.generate(
                                                    5,
                                                    (index) {
                                                      return Text(
                                                          '202${4 + index}');
                                                    },
                                                  ),
                                                )
                                              : const SizedBox(),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox.shrink();
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    cvvController.dispose();
    nameAndSurnameController.dispose();
    super.dispose();
  }
}
