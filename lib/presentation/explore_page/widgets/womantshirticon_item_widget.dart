import 'package:ayhan_s_application1/core/app_export.dart';
import 'package:ayhan_s_application1/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WomantshirticonItemWidget extends StatelessWidget {
  const WomantshirticonItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          height: 70.adaptSize,
          width: 70.adaptSize,
          padding: EdgeInsets.all(23.h),
          child: CustomImageView(
            imagePath: ImageConstant.imgWomanTShirtIcon,
          ),
        ),
        SizedBox(height: 7.v),
        Text(
          "lbl_t_shirt".tr,
          style: CustomTextStyles.labelMediumBluegray300,
        ),
      ],
    );
  }
}
