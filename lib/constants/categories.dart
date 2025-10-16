class AppCategories {
  // Category names
  static const String all = 'All';
  static const String fruits = 'Fruits';
  static const String fish = 'Fish';
  static const String meat = 'Meat';
  static const String vegetable = 'Vegetable';
  static const String rice = 'Rice';
  static const String chocolate = 'Chocolate';
  static const String bakery = 'Bakery';
  static const String oil = 'Oil';

  // List of category names for tabs
  static const List<String> categoryNames = [
  
    fruits,
    fish,
    meat,
    vegetable,
    rice,
    chocolate,
    bakery,
    oil,
  ];
  static const Map<String, String> categoryImages = {
   
    fruits: 'assets/images/pomegranate.png',
    fish: 'assets/images/fish.png',
    meat: 'assets/images/meat.png',
    vegetable: 'assets/images/vegetable.png',
    rice: 'assets/images/rice.png',
    chocolate: 'assets/images/chocolate.png',
    bakery: 'assets/images/bakery.png',
    oil: 'assets/images/oil.png',
  };

  static String getCategoryImage(String categoryName) {
    return categoryImages[categoryName] ?? 'assets/images/all.png';
  }

   
}
