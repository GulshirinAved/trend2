import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend_marketplace2/blocs/order/orderFilter/order_filter_bloc.dart';
import 'package:trend_marketplace2/config/constants/constants.dart';
import 'package:trend_marketplace2/config/theme/theme.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_appBar.dart';
import 'package:trend_marketplace2/presentation/CustomWidgets/custom_textfield.dart';
import 'package:trend_marketplace2/presentation/Screens/cart/components/customTextField_dropDown.dart';
import 'package:trend_marketplace2/presentation/Screens/profile/components/order_card.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late TextEditingController orderController;
  @override
  void initState() {
    super.initState();
    orderController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderFilterBloc(),
      child: Scaffold(
        appBar: CustomAppBar.leadingWithTitle('Orders'),
        body: Container(
          color: AppColors.whiteColor,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //search with filter
              Row(
                children: [
                  const Expanded(
                    child: CustomTextField(
                      title: 'Search from my orders',
                    ),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  BlocBuilder<OrderFilterBloc, OrderFilterState>(
                    builder: (context, state) {
                      return CustomDropDown(
                        dropDownColor: AppColors.whiteColor,
                        height: 40.h,
                        hintText: 'All',
                        dropDownValue: state.selectedValue,
                        onChanged: (value) {
                          context
                              .read<OrderFilterBloc>()
                              .add(orderFilterPressedEvent(pressValue: value!));
                        },
                        items: orderFilter,
                      );
                    },
                  ),
                ],
              ),
              //cards
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return const OrderCard();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    orderController.dispose();
    super.dispose();
  }
}
