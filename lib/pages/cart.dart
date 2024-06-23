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
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              tileColor: Colors.yellow[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Colors.transparent)),
              leading: CircleAvatar(
                backgroundColor: null,
                radius: 30,
                backgroundImage: AssetImage(cart[index]['url'] as String),
              ),
              title: Text('Product Name: ${cart[index]['name']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Type: ${cart[index]['options']}",
                  ),
                  Text(
                    "Price: \$${cart[index]['price']}",
                  ),
                ],
              ),
              trailing: IconButton(
                alignment: Alignment.topRight,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Delete Product",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        content: const Text(
                            "Are you sure you want to delete this product from your cart?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "No",
                                style: TextStyle(color: Colors.blue),
                              )),
                          TextButton(
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .removeFromCart(cart[index]);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Yes",
                                style: TextStyle(color: Colors.red),
                              ))
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 255, 17, 0),
                  size: 30,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
