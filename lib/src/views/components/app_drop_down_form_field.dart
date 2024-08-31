import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:product_catalog_app/src/utils/colours.dart';

class AppDropDownFormField extends StatelessWidget {
  const AppDropDownFormField({
    super.key,
    this.items,
    this.onChanged,
    this.value,
    required this.hintText,
    required this.label,
    this.validator,
  });

  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;
  final String? value;
  final String hintText, label;
  final String? Function(String?)? validator;

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
        DropdownButtonFormField<String>(
          hint: Text(hintText),
          value: value,
          items: items,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colours.grey, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Colours.grey, width: 1.5),
            ),
            contentPadding: const EdgeInsets.all(12.0),
          ),
        ),
      ],
    );
  }
}
