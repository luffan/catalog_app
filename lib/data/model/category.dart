enum Category {
  electronics,
  jewelery,
  menClothing,
  womenClothing,
}

extension CategoryExt on Category {
  static Category? getByName(String? type) {
    if (type == null) return null;

    return Category.values.where((category) => category.apiName == type).first;
  }

  String get apiName {
    switch (this) {
      case Category.electronics:
        return 'electronics';
      case Category.jewelery:
       return 'jewelery';
      case Category.menClothing:
        return 'men\'s clothing';
      case Category.womenClothing:
        return 'women\'s clothing';
    }
  }
}
