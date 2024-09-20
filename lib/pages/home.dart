import 'package:flutter/material.dart';
import 'package:shoppingapp/Widgets/product_card.dart';
import 'package:shoppingapp/Widgets/productslibrary.dart';
import 'package:shoppingapp/pages/product_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> categories = const [
    "All",
    "Shoes",
    "Jeans",
    "Tshirts",
    "Glasses",
    "Watches",
    "Laptops",
    "Phones"
  ];
  int selectedIndex = 0;

  // Method to filter products based on the selected category
  List filterProducts() {
    return products.where((product) {
      return categories[selectedIndex] == product['category'] ||
          categories[selectedIndex] == "All";
    }).toList();
  }

  // Method to handle category selection
  void handleCategoryTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // Method to build the search bar and title row
  Widget buildSearchBarAndTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shopping Collection",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
              ),
              const SizedBox(height: 6),
              Text(
                "Explore our categories",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ],
          ),
          const Spacer(),
          // Reduced and centered the search bar
          SizedBox(
            width: 180,
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0), // Vertically centered
                  hintText: "Search...",
                  prefixIcon: Icon(Icons.search, size: 18),
                  border: InputBorder.none,
                ),
                textAlignVertical:
                    TextAlignVertical.center, // Center text inside
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build the category list as horizontal chips
  Widget buildCategoryChips() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () => handleCategoryTap(index),
              child: Chip(
                label: Text(
                  categories[index],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                backgroundColor: selectedIndex == index
                    ? Colors.yellow[700]
                    : Colors.grey[200],
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Colors.transparent),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Method to build the product grid
  Widget buildProductGrid(BuildContext context, BoxConstraints constraints) {
    final productCount = (constraints.maxWidth / 250).truncate();
    final List productShown = filterProducts();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: productCount, childAspectRatio: 1.04),
      itemCount: productShown.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ProductDetails(
                    product: productShown[index],
                  );
                },
              ),
            );
          },
          child: ProductCard(
            name: productShown[index]['name'],
            price: "\$${productShown[index]['price']}",
            image: productShown[index]['url'] as String,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search bar and title
            buildSearchBarAndTitle(context),

            // Categories as chips
            buildCategoryChips(),

            const SizedBox(height: 16),

            // Product grid
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return buildProductGrid(context, constraints);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
