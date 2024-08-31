import 'package:flutter/material.dart';
import 'package:product_catalog_app/src/views/components/section_title.dart';
import 'package:product_catalog_app/src/utils/colours.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({
    super.key,
    required this.desc,
  });
  final String desc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        sheetAnimationStyle: AnimationStyle(
          duration: const Duration(milliseconds: 700),
        ),
        context: context,
        builder: (context) => const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
              child: SectionTitle(text: "Description", isTitle: true),
            ),
            Divider(),
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colours.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: SectionTitle(
                text: "Description",
                action: Icon(Icons.keyboard_arrow_right),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                10.0,
                0.0,
                10.0,
                10.0,
              ),
              child: Text(
                "$desc " * 100,
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
