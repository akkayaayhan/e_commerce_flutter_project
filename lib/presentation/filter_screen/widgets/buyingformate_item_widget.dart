import 'package:ayhan_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuyingformateItemWidget extends StatelessWidget {
  const BuyingformateItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
      ),
      child: RawChip(
        padding: EdgeInsets.all(16.h),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          "All Listings",
          style: TextStyle(
            color: appTheme.blueGray300,
            fontSize: 12.fSize,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: false,
        backgroundColor: Colors.transparent,
        selectedColor: theme.colorScheme.primary.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: appTheme.blue50,
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(
            5.h,
          ),
        ),
        onSelected: (value) {},
      ),
    );
  }
}
