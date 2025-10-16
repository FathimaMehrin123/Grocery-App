import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grocery_app/service/cart_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartService cartService = CartService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _saveOrderToFirebase() async {
    try {
      await _firestore.collection('orders').add({
        'items': cartService.cartItems.map((item) {
          return {
            'id': item.item.id,
            'name': item.item.name,
            'price': item.item.price,
            'quantity': item.quantity,
            'unit': item.item.unit,
          };
        }).toList(),
        'totalPrice': cartService.getTotalPrice() + 40,
        'timestamp': FieldValue.serverTimestamp(),
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Order placed successfully!'),
          backgroundColor: Color(0xFF5FB839),
          duration: Duration(seconds: 2),
        ),
      );
      
      cartService.clearCart();
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error placing order: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: cartService.cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Add items to get started',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: cartService.cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartService.cartItems[index];
                      final itemTotal = cartItem.item.price * cartItem.quantity;
                      
                      return  Slidable(
  key: ValueKey(cartItem.item.id),
  endActionPane: ActionPane(
    motion: const DrawerMotion(),
    extentRatio: 0.25,
    children: [
      SlidableAction(
        onPressed: (_) {
          setState(() {
            cartService.removeFromCart(cartItem.item.id);
          });
        },
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        icon: Icons.delete,
        borderRadius: BorderRadius.circular(12),
      ),
    ],
  ),
  child: Container(
    margin: EdgeInsets.only(bottom: 12),
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey[200]!),
    ),
    child: Row(
      children: [
        // Product Image
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              cartItem.item.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 12),

        // Product Details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.item.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '₹${cartItem.item.price.toStringAsFixed(0)}/${cartItem.item.unit}',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF5FB839),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Total: ₹${(cartItem.item.price * cartItem.quantity).toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),

        // Quantity Controls
        Container(
          decoration: BoxDecoration( border: Border.all(color: Colors.grey[300]!),
           borderRadius: BorderRadius.circular(10), color: Colors.green ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    cartService.updateQuantity(
                      cartItem.item.id,
                      cartItem.quantity + 1,
                    );
                  });
                },
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor:Colors.white,
                  child: Icon(Icons.add, size: 14, color: Colors.black),
                ),
              ),
              SizedBox(height: 6),
              Text(
                '${cartItem.quantity}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (cartItem.quantity > 1) {
                      cartService.updateQuantity(
                        cartItem.item.id,
                        cartItem.quantity - 1,
                      );
                    }
                  });
                },
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.remove, size: 14, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);

                    },
                  ),
                ),
                
                // Price Summary and Checkout
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)
                    ),
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.grey[200]!),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Subtotal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            '₹${cartService.getTotalPrice().toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      
                      // Delivery Cost
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery cost',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            '₹40',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                     
                      SizedBox(height: 12),
                      
                      // Total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total cost',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '₹${(cartService.getTotalPrice() + 40).toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5FB839),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      
                      // Checkout Button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _saveOrderToFirebase,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF5FB839),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}