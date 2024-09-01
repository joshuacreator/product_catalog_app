import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_catalog_app/src/controllers/hive_db_controller.dart';
import 'package:product_catalog_app/src/models/product.dart';
import 'package:product_catalog_app/src/services/image_service.dart';
import 'package:product_catalog_app/src/utils/app_snack_bar.dart';
import 'package:product_catalog_app/src/utils/colours.dart';
import 'package:product_catalog_app/src/utils/constants.dart';
import 'package:product_catalog_app/src/utils/dimensions.dart';
import 'package:product_catalog_app/src/views/components/app_drop_down_form_field.dart';
import 'package:product_catalog_app/src/views/components/buttons.dart';
import 'package:product_catalog_app/src/views/components/section_title.dart';
import 'package:product_catalog_app/src/views/components/text_form_field.dart';

class NewProductScreen extends ConsumerStatefulWidget {
  static String name = "new-product", path = "new-product";

  const NewProductScreen({super.key, this.product, this.productIndex});
  final Product? product;
  final int? productIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewProductScreenState();
}

class _NewProductScreenState extends ConsumerState<NewProductScreen> {
  File? image;

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _categoryController = TextEditingController();

  final List<String> categories = [
    "Electronics",
    "Fashion",
    "Home & Kitchen",
    "Beauty & Personal Care",
  ];

  bool loading = false, nullImage = false;

  @override
  void initState() {
    super.initState();

    if (widget.product != null) {
      _nameController.text = widget.product!.name;
      _priceController.text = widget.product!.price.toString();
      _descriptionController.text = widget.product!.description;
      _categoryController.text = widget.product!.category;

      image = File(widget.product!.image);
    }
  }

  @override
  Widget build(BuildContext context) {
    final productController = ref.watch(productsProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("New product")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(Consts.kPadding),
          children: [
            buildImagePreviewCard(),
            const Gap(20.0),
            AppTextFormField(
              controller: _nameController,
              label: "Product name",
              textInputAction: TextInputAction.next,
              validator: (value) => validator(value),
            ),
            const Gap(20.0),
            AppTextFormField(
              controller: _priceController,
              label: "Product price",
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) => validator(value),
            ),
            const Gap(20.0),
            AppTextFormField(
              controller: _descriptionController,
              label: "Product description",
              textInputAction: TextInputAction.next,
              maxLines: 5,
              validator: (value) => validator(value),
            ),
            const Gap(20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: AppDropDownFormField(
                    hintText: "Select product category",
                    label: "Product category",
                    value: widget.product != null
                        ? _categoryController.text
                        : null,
                    items: categories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _categoryController.text = value.toString();
                      });
                    },
                    validator: (value) => validator(value),
                  ),
                ),
                IconButton.filledTonal(
                  onPressed: () {
                    // TODO: Add new category
                    showModalBottomSheet(
                      isScrollControlled: true,
                      useSafeArea: true,
                      context: context,
                      sheetAnimationStyle: AnimationStyle(
                        duration: const Duration(milliseconds: 700),
                      ),
                      builder: (context) => buildNewCategoryWidget(),
                    );
                  },
                  icon: const Icon(Icons.add_rounded),
                ),
              ],
            ),
            const Gap(30.0),
            AppElevatedButton(
              label: widget.product != null ? "Update" : "Save",
              onPressed: () async {
                if (image == null) {
                  setState(() {
                    nullImage = true;
                  });
                  return;
                }
                if (_formKey.currentState!.validate()) {
                  setState(() => loading = !loading);

                  final Product product = Product(
                    name: _nameController.text.trim(),
                    description: _descriptionController.text.trim(),
                    price: double.parse(_priceController.text.trim()),
                    category: _categoryController.text.trim(),
                    image: image!.path,
                  );

                  widget.product != null
                      ? await productController
                          .updateProduct(widget.productIndex!, product)
                          .then((value) {
                          context.pop();
                          context.pop();
                          showAppSnackBar(
                              context, "Product updated successfully");
                        })
                      : await productController.addProduct(product).then(
                          (value) {
                            context.pop();
                            showAppSnackBar(
                                context, "Product created successfully");
                          },
                        );
                }
              },
              loading: loading,
            ),
          ],
        ),
      ),
    );
  }

  String? validator(String? value) {
    if (value == null || value.isEmpty) return "This field is required";
    return null;
  }

  Widget buildNewCategoryWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 0.0),
          child: SectionTitle(text: "New category", isTitle: true),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: AppTextFormField(
            controller: _nameController,
            label: "Category name",
            autofocus: true,
          ),
        ),
        Gap(MediaQuery.viewInsetsOf(context).bottom),
      ],
    );
  }

  InkWell buildImagePreviewCard() {
    return InkWell(
      onTap: () => showModalBottomSheet(
        sheetAnimationStyle: AnimationStyle(
          duration: const Duration(milliseconds: 700),
        ),
        context: context,
        builder: (context) => buildImageSourceWidget(),
      ),
      borderRadius: BorderRadius.circular(Consts.kBorderRadiusTen),
      child: Ink(
        height: dimension * 6,
        decoration: BoxDecoration(
          color: Colours.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(Consts.kBorderRadiusTen),
          border: nullImage ? Border.all(color: Colours.red, width: 1.5) : null,
        ),
        child: image == null
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.image_rounded,
                      color: nullImage ? Colours.red : Colours.grey,
                      size: dimension * 2,
                    ),
                    Text(
                      "Tap to select image",
                      style: TextStyle(
                        color: nullImage ? Colours.red : Colours.secondaryText,
                      ),
                    ),
                  ],
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(Consts.kBorderRadiusTen),
                child: Image.file(image!, fit: BoxFit.cover),
              ),
      ),
    );
  }

  Column buildImageSourceWidget() {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      const Padding(
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 0.0),
        child: SectionTitle(text: "Image source", isTitle: true),
      ),
      const Divider(),
      ListTile(
        leading: const Icon(Icons.camera_alt_rounded),
        title: const Text("Camera"),
        onTap: () {
          context.pop();
          ImageService.pickImage(ImageSource.camera).then(
            (value) => ImageService.cropImage(value!.path).then(
              (croppedImg) => setState(() {
                image = croppedImg;
              }),
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.sd_card_rounded),
        title: const Text("Gallery"),
        onTap: () {
          context.pop();
          ImageService.pickImage(ImageSource.gallery).then(
            (value) => ImageService.cropImage(value!.path).then(
              (croppedImg) => setState(() {
                image = croppedImg;
              }),
            ),
          );
        },
      ),
    ]);
  }
}
