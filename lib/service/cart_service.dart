import 'package:grocery_app/model.dart/categorymodel.dart';

class CartItem {
  final CategoryItem item;
  int quantity;

  CartItem({
    required this.item,
    this.quantity = 1,
  });
}

class CartService {
  static final CartService _instance = CartService._internal();
  
  factory CartService() {
    return _instance;
  }
  
  CartService._internal();

  List<CartItem> _cartItems = [];
  List<CategoryItem> _favourites = [];

  List<CartItem> get cartItems => _cartItems;
  List<CategoryItem> get favourites => _favourites;

  void addToCart(CategoryItem item) {
    final existingIndex = _cartItems.indexWhere((c) => c.item.id == item.id);
    
    if (existingIndex >= 0) {
      _cartItems[existingIndex].quantity++;
    } else {
      _cartItems.add(CartItem(item: item));
    }
  }

  void removeFromCart(String itemId) {
    _cartItems.removeWhere((item) => item.item.id == itemId);
  }

  void updateQuantity(String itemId, int quantity) {
    final index = _cartItems.indexWhere((c) => c.item.id == itemId);
    if (index >= 0 && quantity > 0) {
      _cartItems[index].quantity = quantity;
    } else if (quantity <= 0) {
      removeFromCart(itemId);
    }
  }

  void clearCart() {
    _cartItems.clear();
  }

  double getTotalPrice() {
    return _cartItems.fold(
      0,
      (sum, item) => sum + (item.item.price * item.quantity),
    );
  }

  void toggleFavourite(CategoryItem item) {
    final index = _favourites.indexWhere((fav) => fav.id == item.id);
    
    if (index >= 0) {
      _favourites.removeAt(index);
    } else {
      _favourites.add(item);
    }
  }

  bool isFavourite(String itemId) {
    return _favourites.any((fav) => fav.id == itemId);
  }

  void removeFavourite(String itemId) {
    _favourites.removeWhere((item) => item.id == itemId);
  }
}