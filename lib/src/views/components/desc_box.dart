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
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
              child: SectionTitle(text: "Description", isTitle: true),
            ),
            Divider(
              color: Colours.dividerColour,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                10.0,
                0.0,
                10.0,
                10.0,
              ),
              child: Text(
                desc,
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12.0),
              ),
            ),
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
            Divider(color: Colours.dividerColour.withOpacity(0.1)),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                10.0,
                0.0,
                10.0,
                10.0,
              ),
              child: Text(
                desc,
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
