import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.text,
    this.action,
    this.fontSize,
    this.fontWeight,
    this.padding = 0.0,
    this.isTitle = false,
  });

  final String text;
  final Widget? action;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double padding;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: isTitle ? 18.0 : 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          action ?? const SizedBox(),
        ],
      ),
    );
  }
}
