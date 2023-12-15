import 'package:ayhan_s_application1/core/app_export.dart';
import 'package:ayhan_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:ayhan_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:ayhan_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:ayhan_s_application1/widgets/custom_elevated_button.dart';
import 'package:ayhan_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController newpasswordController1 = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 26.v),
                    child: Column(children: [
                      _buildOldPassword(context),
                      SizedBox(height: 23.v),
                      _buildNewPassword(context),
                      SizedBox(height: 24.v),
                      _buildConfirmPassword(context),
                      SizedBox(height: 5.v)
                    ]))),
            bottomNavigationBar: _buildSave(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlueGray300,
            margin: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "lbl_change_password".tr,
            margin: EdgeInsets.only(left: 12.h)));
  }

  /// Section Widget
  Widget _buildOldPassword(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_old_password".tr, style: theme.textTheme.titleSmall),
      SizedBox(height: 12.v),
      CustomTextFormField(
          controller: passwordController,
          hintText: "msg".tr,
          hintStyle: CustomTextStyles.labelLargeBluegray300,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLock,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 48.v),
          obscureText: true,
          contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildNewPassword(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_new_password".tr, style: theme.textTheme.titleSmall),
      SizedBox(height: 12.v),
      CustomTextFormField(
          controller: newpasswordController,
          hintText: "msg".tr,
          hintStyle: CustomTextStyles.labelLargeBluegray300,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLock,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 48.v),
          obscureText: true,
          contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildConfirmPassword(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_new_password_again".tr, style: theme.textTheme.titleSmall),
      SizedBox(height: 11.v),
      CustomTextFormField(
          controller: newpasswordController1,
          hintText: "msg".tr,
          hintStyle: CustomTextStyles.labelLargeBluegray300,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(16.h, 12.v, 10.h, 12.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgLock,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 48.v),
          obscureText: true,
          contentPadding: EdgeInsets.only(top: 15.v, right: 30.h, bottom: 15.v),
          borderDecoration: TextFormFieldStyleHelper.outlineBlueTL5,
          filled: false)
    ]);
  }

  /// Section Widget
  Widget _buildSave(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_save".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 50.v));
  }
}
