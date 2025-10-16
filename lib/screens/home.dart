import 'package:flutter/material.dart';
import 'package:grocery_app/constants/appcolor.dart';
import 'package:grocery_app/constants/apptext.dart';
import 'package:grocery_app/constants/categories.dart';
import 'package:grocery_app/data.dart/category_data.dart';
import 'package:grocery_app/model.dart/categorymodel.dart';
import 'package:grocery_app/service/cart_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CartService cartService = CartService();
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<CategoryItem> currentItems = CategoryData.getItemsByCategory(
      AppCategories.categoryNames[_selectedCategoryIndex],
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Padding(
  padding: const EdgeInsets.only(left: 8),
  child: Container(
    decoration: BoxDecoration(
      
      shape: BoxShape.circle,
      border: Border.all(color: Colors.black, width: 1.3),
    ),
    child: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 15,
      child: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black, size: 18),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
  ),
),
            SizedBox(width: 10),
            Text('MG South Kochi'),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for groceries',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Up to 25% offer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Have our top pick for you',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('shop Now'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/allgroceries.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 AppText(
                      text: 'Category',
                      size: 18,
                      color: Colors.black ,
                      weight: FontWeight.normal
                    ),
                InkWell(child: 
                AppText(
                      text: 'See All',
                      size: 14,
                      color: AppColors.accent ,
                      weight: FontWeight.normal
                    ),
                 onTap: () {}),
              ],
            ),
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: AppCategories.categoryNames.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedCategoryIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 12),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Color(0xFF5FB839)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          AppCategories.categoryNames[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: currentItems.isEmpty
                  ? Center(
                      child: Text(
                        'No items available in this category',
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: currentItems.length,
                      itemBuilder: (context, index) {
                        CategoryItem item = currentItems[index];
                        bool isFav = cartService.isFavourite(item.id);

                        return Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Container(
                            color: Colors.white,
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Item Image
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Image.asset(
                                              item.image,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                    return Icon(
                                                      Icons.image,
                                                      size: 50,
                                                      color: Colors.grey,
                                                    );
                                                  },
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),

                                      // Item Name
                                      Text(
                                        item.name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4),
                                    Text('500g'),
                                      
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '₹ ${item.price.toStringAsFixed(0)}',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF5FB839),
                                            ),
                                          ),
                                         
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                    ],
                                  ),
                                ),
                                // Heart and Add Button
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          cartService.toggleFavourite(item);
                                        });
                                      },
                                      child:Icon(
  Icons.favorite, 
  color: isFav ? Colors.red : Colors.black, 
  size: 24,
),
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 13,
                                      child: GestureDetector(
                                        onTap: () {
                                          cartService.addToCart(item);
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                '${item.name} added to cart',
                                              ),
                                              duration: Duration(
                                                milliseconds: 800,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
