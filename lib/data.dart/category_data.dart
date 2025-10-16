

import 'package:grocery_app/model.dart/categorymodel.dart';

class CategoryData {
  static const List<CategoryItem> fruitsItems = [
   
      CategoryItem(
     id: 'apple_1',
      name: 'Apple',
      image: 'assets/images/apple.png',
      price: 100,
      unit: 'kg',
    ),
      CategoryItem(
          id: 'pomegranate_1',
      name: 'Pomegranate',
      image: 'assets/images/pomegranate.png',
      price: 94,
      unit: 'kg',
    ),
      CategoryItem(
         id: 'musambi_1',
      name: 'Pomegranate',
      image: 'assets/images/musambi.png',
      price: 65,
      unit: 'kg',
    ),
    CategoryItem(
       id: 'banana_1',
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

     CategoryItem(
      id: 'tomato_1',
      name: 'Tomato',
      image: 'assets/images/tomato.png',
      price: 32,
      unit: 'kg',
    ),
  ];

  
  static const List<CategoryItem> riceItems = [
   
  ];

  
  static const List<CategoryItem> chocolateItems = [
    
  ];

  
  static const List<CategoryItem> bakeryItems = [
    
  ];

  
  static const List<CategoryItem> oilItems = [
    CategoryItem(
       id: 'sunflower_oil_1',
      name: 'Sunflower Oil',
      image: 'assets/images/sunfloweroil.png',
      price: 146,
      unit: 'kg',
    ),
  ];

  
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