![Home Screen Preview](/assets/screenshots/home_preview.png)
![Details Screen Preview](/assets/screenshots/details_preview.png)
![Edit Screen Preview](/assets/screenshots/edit_preview.png)
![Search Screen Preview](/assets/screenshots/search_preview.png)

# Product Catalog App - A Flutter App for Product Management

This is a simple Flutter app that allows users to create, view, edit, and delete products. Each product has a name, price, description, category, and an image.

## Features

- Create new products
- View a list of all products
- Edit existing products
- Delete products
- View detailed information about a product
- Search products by name
- Local storage using `hive`
- Routing with `go_router`
- State management with `flutter_riverpod`
- SVG image display with `flutter_svg`
- Image picking with `image_picker`
- Image cropping with `image_cropper`
- Currency formatting with `intl`

## Getting Started

### Prerequisites:

- Intermediate-level knowledge of Flutter and Dart
- [Flutter development environment set up] (https://docs.flutter.dev/get-started/install)
- `hive` package installed: `flutter pub add hive`
- `hive_flutter` package installed: `flutter pub add hive`
- `hive_generator` dev dependency installed: `flutter pub add hive_generator --dev`
- `build_runner` dev dependency installed: `flutter pub add build_runner --dev`
- `go_router` package installed: `flutter pub add go_router`
- `flutter_riverpod` package installed: `flutter pub add flutter_riverpod`
- `flutter_svg` package installed: `flutter pub add flutter_svg`
- `image_picker` package installed: `flutter pub add image_picker`
- `image_cropper` package installed: `flutter pub add image_cropper`
- `intl` package installed: flutter pub add `intl`

### Running the app:

1. Clone this repository.
2. Open the project in your favorite IDE.
3. Run `flutter pub get` to download the above listed dependencies
4. Run the app using `flutter run`.

### Project Structure

```
|lib/
| - src/
|   - controllers/
|       - hive_db_controller.dart
|   - models/
|       - product.dart
|       - product.g.dart // Generated using `build_runner` and `hive_generator`
|   - routes/
|       - routes.dart
|   - services/
|       - image_service.dart
|   - utils/
|       - app_snack_bar.dart
|       - assets.dart // A class for managing app assets
|       - colours.dart // Colour class
|       - constants.dart
|       - currency_formatter.dart
|       - responsive_size.dart
|       - themes.dart
|   - views/
|       - components/
|           - app_drop_down_form_field.dart
|           - buttons.dart
|           - custom_search_bar.dart
|           - desc_box.dart
|           - item_card.dart
|           - product_view_builder.dart // Contains build methods for rendering a `Gridview.builder` and a horizontal `Listview.builder`
|           - section_title.dart
|           - text_form_field.dart
|       - screens/
|           - home_screen.dart
|           - new_product_screen.dart
|           - product_details_screen.dart
|           - search_delegate.dart
| - main.dart
```

### Hive Configuration

This app uses Hive for local storage. You can define your data models and configure Hive in the `lib/src/models/product` directory.

### Routing

`go_router` is used for navigation. Define your routes and navigation logic in the `lib/src/routes/routes.dart` file.

### State Management

Flutter Riverpod is used for state management. The ProductListNotifier class in the `lib/src/controllers/hive_db_controller.dart` file handles loading, adding, updating and deleting products.

### Search Functionality

The search screen allows users to search and filter products by name and category. This can be implemented in the `lib/src/views/screens/search_delegate.dart` file.

### Image Handling

The app allows picking and cropping images using `image_picker` and `image_cropper` packages. You can implement image selection and display in the `lib/src/services/image_services.dart` file.

### Currency Formatting

The app uses the `intl` package for currency formatting. You can implement currency formatting in the `lib/src/utils/currency_formatter.dart` file.

## License

This project is licensed under the MIT License.
