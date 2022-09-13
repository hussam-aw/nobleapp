import 'package:flutter/material.dart';
import 'package:noble/Constants/font_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Constants/colors.dart';

/* import 'package:noble/Constants/colors.dart';

import '../../Constants/font_styles.dart';
 */
/* GlobalKey<FormState> formState2 = new GlobalKey<FormState>();
 */
class Verify extends StatelessWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(10),
            fieldHeight: 50,
            fieldWidth: 50,
            selectedColor: AppColors.orange,
            activeFillColor: Colors.white,
            inactiveFillColor: AppColors.lightwhite,
            inactiveColor: AppColors.lightgrey,
            selectedFillColor: AppColors.lightwhite,
            activeColor: AppColors.lightgrey),
        appContext: context,
        length: 6,
        onChanged: (_) {},
        autoFocus: true,
        cursorColor: AppColors.blue,
        textStyle: blue18NoBold,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
