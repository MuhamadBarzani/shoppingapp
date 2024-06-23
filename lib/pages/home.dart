import 'package:flutter/material.dart';
import 'package:shoppingapp/Widgets/globalvariable.dart';
import 'package:shoppingapp/Widgets/product_card.dart';
import 'package:shoppingapp/pages/product_details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> catagories = const [
    "All",
    "Shoes",
    "Jeans",
    "T-shirts",
    "Glasses",
    "Watches",
    "Laptops",
    "Mobile Phones"
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    "Shopping \n  Collection",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(width: 2)
              ],
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: catagories.length, // Use the correct length
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Chip(
                        label: Text(
                          catagories[index],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: selectedIndex == index
                            ? Colors.yellow[400]
                            : Colors.grey[200],
                        labelPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Expanded(child: LayoutBuilder(
              builder: (context, constraints) {
                final productCount = (constraints.maxWidth / 250).truncate();
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: productCount, childAspectRatio: 1.04),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Debugging line
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return ProductDetails(
                                product: products[index],
                              );
                            },
                          ),
                        );
                      },
                      child: ProductCard(
                        name: products[index]['name'],
                        price: "\$" + (products[index]['price']),
                        image: products[index]['url'] as String,
                      ),
                    );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
