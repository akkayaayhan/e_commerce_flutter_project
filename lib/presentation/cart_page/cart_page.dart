import '../cart_page/widgets/cartlist_item_widget.dart';
import 'package:ayhan_s_application1/core/app_export.dart';
import 'package:ayhan_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:ayhan_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ayhan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:ayhan_s_application1/widgets/custom_elevated_button.dart';
import 'package:ayhan_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  TextEditingController cuponCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 7.v),
                child: Column(children: [
                  _buildCartList(context),
                  SizedBox(height: 52.v),
                  _buildCouponCodeRow(context),
                  SizedBox(height: 16.v),
                  _buildTotalPriceDetailsColumn(context),
                  SizedBox(height: 16.v),
                  CustomElevatedButton(
                      text: "lbl_check_out".tr,
                      onPressed: () {
                        onTapCheckOut(context);
                      }),
                  SizedBox(height: 8.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitle(
            text: "lbl_your_cart".tr, margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgNotificationIcon,
              margin: EdgeInsets.fromLTRB(13.h, 15.v, 13.h, 16.v),
              onTap: () {
                onTapNotificationIcon(context);
              })
        ]);
  }

  /// Section Widget
  Widget _buildCartList(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 16.v);
        },
        itemCount: 2,
        itemBuilder: (context, index) {
          return CartlistItemWidget();
        });
  }

  /// Section Widget
  Widget _buildCouponCodeRow(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
          child: CustomTextFormField(
              controller: cuponCodeController,
              hintText: "msg_enter_cupon_code".tr,
              textInputAction: TextInputAction.done,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.h, vertical: 19.v))),
      CustomElevatedButton(
          width: 87.h,
          text: "lbl_apply".tr,
          buttonStyle: CustomButtonStyles.fillPrimary,
          buttonTextStyle: CustomTextStyles.labelLargeOnPrimaryContainer)
    ]);
  }

  /// Section Widget
  Widget _buildTotalPriceDetailsColumn(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.h),
        decoration: AppDecoration.outlineBlue50
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder5),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildShoppingPriceRow(context,
                  shippingLabel: "lbl_items_3".tr, priceLabel: "lbl_598_86".tr),
              SizedBox(height: 16.v),
              _buildShoppingPriceRow(context,
                  shippingLabel: "lbl_shipping".tr, priceLabel: "lbl_40_00".tr),
              SizedBox(height: 14.v),
              _buildShoppingPriceRow(context,
                  shippingLabel: "lbl_import_charges".tr,
                  priceLabel: "lbl_128_00".tr),
              SizedBox(height: 12.v),
              Divider(),
              SizedBox(height: 10.v),
              _buildShoppingPriceRow(context,
                  shippingLabel: "lbl_total_price".tr,
                  priceLabel: "lbl_766_86".tr)
            ]));
  }

  /// Common widget
  Widget _buildShoppingPriceRow(
    BuildContext context, {
    required String shippingLabel,
    required String priceLabel,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(shippingLabel,
              style: theme.textTheme.bodySmall!
                  .copyWith(color: appTheme.blueGray300))),
      Text(priceLabel,
          style: CustomTextStyles.bodySmallOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary.withOpacity(1)))
    ]);
  }
}
