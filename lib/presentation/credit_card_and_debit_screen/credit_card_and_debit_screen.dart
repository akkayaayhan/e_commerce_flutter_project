import '../credit_card_and_debit_screen/widgets/creditcardanddebit_item_widget.dart';
import 'package:ayhan_s_application1/core/app_export.dart';
import 'package:ayhan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:ayhan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:ayhan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:ayhan_s_application1/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CreditCardAndDebitScreen extends StatelessWidget {
  const CreditCardAndDebitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 9.v),
                child: Column(children: [
                  SizedBox(height: 8.v),
                  _buildCreditCardAndDebit(context)
                ])),
            bottomNavigationBar: _buildAddCard(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlueGray300,
            margin: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 15.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "msg_credit_card_and".tr,
            margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildCreditCardAndDebit(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 14.v);
                },
                itemCount: 2,
                itemBuilder: (context, index) {
                  return CreditcardanddebitItemWidget(onTapCreditCardItem: () {
                    onTapCreditCardItem(context);
                  });
                })));
  }

  /// Section Widget
  Widget _buildAddCard(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_add_card".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
        onPressed: () {
          onTapAddCard(context);
        });
  }
}
