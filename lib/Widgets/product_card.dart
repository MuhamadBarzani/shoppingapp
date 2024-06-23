import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Stack(
          children: [
            Center(child: Image.asset(image)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              blurRadius: 10.0,
                              color: Colors.yellow,
                              offset: Offset(0, 0)),
                          Shadow(
                              blurRadius: 20.0,
                              color: Colors.black,
                              offset: Offset(0, 0)),
                          Shadow(
                              blurRadius: 30.0,
                              color: Colors.black,
                              offset: Offset(0, 0)),
                        ],
                      )),
                  Text(price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              blurRadius: 10.0,
                              color: Colors.yellow,
                              offset: Offset(0, 0)),
                          Shadow(
                              blurRadius: 20.0,
                              color: Colors.black,
                              offset: Offset(0, 0)),
                          Shadow(
                              blurRadius: 30.0,
                              color: Colors.black,
                              offset: Offset(0, 0)),
                        ],
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
