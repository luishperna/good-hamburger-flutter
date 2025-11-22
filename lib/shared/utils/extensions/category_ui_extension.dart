import '../../../features/menu/models/category_enum.dart';

extension CategoryUiExtension on CategoryEnum {
  bool get isExtraGroupType {
    return this == CategoryEnum.fries ||
        this == CategoryEnum.drink ||
        this == CategoryEnum.extras;
  }
}
