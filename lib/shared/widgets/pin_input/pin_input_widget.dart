import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_text_styles.dart';
import 'package:pinput/pinput.dart';

class PinInputWidget extends StatelessWidget {
  final Function(String?) onChanged;
  final Function(String?)? onComplete;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const PinInputWidget(
      {super.key,
      required this.onChanged,
      this.onComplete,
      required this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      validator: validator,
      length: 6,
      onChanged: onChanged,
      onCompleted: onComplete,
      controller: controller,
      defaultPinTheme: PinTheme(
          height: 45,
          width: 45,
          textStyle: TextStyles.pinInput,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border:
                  Border.fromBorderSide(BorderSide(color: AppColors.primary)))),
    );
  }
}