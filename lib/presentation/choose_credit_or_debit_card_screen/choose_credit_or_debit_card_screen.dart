import '../choose_credit_or_debit_card_screen/widgets/creditcard_item_widget.dart';
import 'package:ayhan_s_application1/core/app_export.dart';
import 'package:ayhan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:ayhan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:ayhan_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:ayhan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:ayhan_s_application1/widgets/custom_elevated_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore_for_file: must_be_immutable
class ChooseCreditOrDebitCardScreen extends StatelessWidget {
  ChooseCreditOrDebitCardScreen({Key? key}) : super(key: key);

  int sliderIndex = 1;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 27.v),
                child: Column(children: [
                  _buildCreditCard(context),
                  SizedBox(height: 16.v),
                  SizedBox(
                      height: 8.v,
                      child: AnimatedSmoothIndicator(
                          activeIndex: sliderIndex,
                          count: 1,
                          axisDirection: Axis.horizontal,
                          effect: ScrollingDotsEffect(
                              spacing: 8,
                              activeDotColor:
                                  theme.colorScheme.primary.withOpacity(1),
                              dotColor: appTheme.blue50,
                              dotHeight: 8.v,
                              dotWidth: 8.h))),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildPayButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlueGray300,
            margin: EdgeInsets.only(left: 16.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_choose_card".tr, margin: EdgeInsets.only(left: 12.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgPlusIcon,
              margin: EdgeInsets.fromLTRB(16.h, 15.v, 16.h, 16.v))
        ]);
  }

  /// Section Widget
  Widget _buildCreditCard(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
            height: 190.v,
            initialPage: 0,
            autoPlay: true,
            viewportFraction: 1.0,
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              sliderIndex = index;
            }),
        itemCount: 1,
        itemBuilder: (context, index, realIndex) {
          return CreditcardItemWidget();
        });
  }

  /// Section Widget
  Widget _buildPayButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_pay_766_86".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v),
        onPressed: () {
          onTapPayButton(context);
        });
  }
}
