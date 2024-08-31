import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:product_catalog_app/src/utils/colours.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.inputFormatters,
    this.onTap,
    this.onChanged,
    this.readOnly = false,
    this.obscureText = false,
    this.autofocus = false,
    this.keyboardType,
    this.textInputAction,
    required this.label,
    this.suffixIcon,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final bool readOnly, obscureText, autofocus;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String label;
  final Widget? suffixIcon;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16.0, color: Colours.secondaryText),
        ),
        const Gap(3.0),
        TextFormField(
          controller: controller,
          validator: validator,
          inputFormatters: inputFormatters,
          onTap: onTap,
          onChanged: onChanged,
          readOnly: readOnly,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          maxLines: maxLines,
          minLines: 1,
          autofocus: autofocus,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colours.grey, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colours.grey, width: 1.5),
            ),
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.all(12.0),
          ),
          onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus,
        ),
      ],
    );
  }
}
