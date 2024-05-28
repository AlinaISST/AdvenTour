import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:explore_era/Provider/cart_provider.dart';

class AgencieDetails extends StatefulWidget {
  final Map agencie;
  const AgencieDetails({super.key, required this.agencie});

  @override
  State<AgencieDetails> createState() => _AgencieDetailsState();
}

class _AgencieDetailsState extends State<AgencieDetails> {
  int selectedSize = -1;
  @override
  Widget build(BuildContext context) {
    final String title = widget.agencie['title'] as String;
    final String price = widget.agencie['price'].toString();
    final String imageUrl = widget.agencie['imageUrl'] as String;
    final List<int> sizes = widget.agencie['sizes'] as List<int>;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            // Text(
            //   title,
            //   style: Theme.of(context).textTheme.titleLarge,
            // ),
            const Spacer(
              flex: 1,
            ),
            Image(
              image: AssetImage(
                imageUrl,
              ),
            ),
            const Spacer(
              flex: 2,  
            ),
            Container(
              color: const Color.fromRGBO(245, 247, 249, 1),
              padding: const EdgeInsets.all(
                20,
              ),
              child: Column(
                children: [
                  Text(
                    "\$ $price",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sizes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              selectedSize = index;
                              setState(() {});
                            },
                            child: Chip(
                              backgroundColor: selectedSize == index
                                  ? Theme.of(context).primaryColor
                                  : null,
                              padding: const EdgeInsets.all(
                                8,
                              ),
                              label: Text(sizes[index].toString()),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(
                        double.infinity,
                        46,
                      ),
                    ),
                    onPressed: () {
                      if(selectedSize == -1){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Please Select a size",
                            ),
                          ),
                        );
                      } else {
                        Provider.of<CartProvider>(context, listen: false)
                            .addItem(widget.agencie);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Item Added To Cart",
                            ),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text(
                      "Add To Cart",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
