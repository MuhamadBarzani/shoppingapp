import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/Providers/cart_manager.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Cart", style: Theme.of(context).textTheme.titleMedium),
      ),
      body: cart.isEmpty
          ? Center(
              child: Text(
                "Your cart is empty!",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          cart[index]['url'] as String,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        cart[index]['name'],
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Check if options is a List, and display it properly
                          if (cart[index]['options'] is List)
                            ...List.generate(
                                (cart[index]['options'] as List).length,
                                (optionIndex) {
                              return Text(
                                "Option ${optionIndex + 1}: ${(cart[index]['options'] as List)[optionIndex]}",
                                style: Theme.of(context).textTheme.bodyMedium,
                              );
                            })
                          else
                            // If options is a string, display it as a single option
                            Text(
                              "Option: ${cart[index]['options']}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          Text(
                            "Price: \$${cart[index]['price']}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.green[700]),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Delete Product",
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                content: const Text(
                                    "Are you sure you want to delete this product from your cart?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("No",
                                        style: TextStyle(color: Colors.blue)),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .read<CartProvider>()
                                          .removeFromCart(cart[index]);
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Yes",
                                        style: TextStyle(color: Colors.red)),
                                  )
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.delete,
                            color: Colors.red, size: 30),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
