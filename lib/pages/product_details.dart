import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/Providers/cart_manager.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetails({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  void onTap() {
    if (selectedOption == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please Select an Option"),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Product added to Cart"),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      );
      context.read<CartProvider>().addToCart(
        {
          "id": widget.product['id'],
          "name": widget.product['name'],
          "price": widget.product['price'],
          "url": widget.product['url'],
          "options":
              (widget.product['options'] as List<String>)[selectedOption],
          "catagory": widget.product['catagory']
        },
      );
    }
  }

  int selectedOption = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Details",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: Column(
        children: [
          Text(
            widget.product['name'] as String,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), boxShadow: const []),
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.product['url'] as String,
                height: 250,
              ),
            ),
          ),
          const Spacer(flex: 2),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Text("\$${widget.product['price'] as String}",
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 8),
                const Text(
                  "Options:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        (widget.product['options'] as List<String>).length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOption = index;
                            });
                          },
                          child: Chip(
                            label: Text(
                              (widget.product['options']
                                  as List<String>)[index],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: selectedOption == index
                                ? Colors.yellow[400]
                                : Colors.grey[200],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Color.fromRGBO(48, 48, 48, 1),
                    ),
                    label: const Text(
                      "Add To Cart",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(48, 48, 48, 1),
                          fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      backgroundColor: const Color.fromARGB(255, 255, 191, 0),
                      fixedSize: const Size(double.infinity, 50),
                    ),
                    onPressed: onTap,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
