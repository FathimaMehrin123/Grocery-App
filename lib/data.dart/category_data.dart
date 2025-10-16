

import 'package:grocery_app/model.dart/categorymodel.dart';

class CategoryData {
  static const List<CategoryItem> fruitsItems = [
   
      CategoryItem(
      name: 'Apple',
      image: 'assets/images/apple.png',
      price: 100,
      unit: 'kg',
    ),
      CategoryItem(
      name: 'Pomegranate',
      image: 'assets/images/pomegranate.png',
      price: 94,
      unit: 'kg',
    ),
      CategoryItem(
      name: 'Pomegranate',
      image: 'assets/images/musambi.png',
      price: 65,
      unit: 'kg',
    ),
    CategoryItem(
      name: 'Banana',
      image: 'assets/images/banana.png',
      price: 35,
      unit: 'kg',
    ),
      
  ];

 
  static const List<CategoryItem> fishItems = [
    
  ];

  
  static const List<CategoryItem> meatItems = [
   
  ];

 
  static const List<CategoryItem> vegetableItems = [
    
  ];

  
  static const List<CategoryItem> riceItems = [
   
  ];

  
  static const List<CategoryItem> chocolateItems = [
    
  ];

  
  static const List<CategoryItem> bakeryItems = [
    
  ];

  
  static const List<CategoryItem> oilItems = [
   
  ];

  // Helper method to get items by category name
  static List<CategoryItem> getItemsByCategory(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'fruits':
        return fruitsItems;
      case 'fish':
        return fishItems;
      case 'meat':
        return meatItems;
      case 'vegetable':
        return vegetableItems;
      case 'rice':
        return riceItems;
      case 'chocolate':
        return chocolateItems;
      case 'bakery':
        return bakeryItems;
      case 'oil':
        return oilItems;
      default:
        return [];
    }
  }
}