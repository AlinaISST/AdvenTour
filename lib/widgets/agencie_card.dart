import 'package:flutter/material.dart';

class AgencieCard extends StatelessWidget {
  final Map agencie;
  final Color bgColor;
  const AgencieCard({super.key, required this.agencie, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    final String title = agencie['title'];
    final String price = agencie['price'].toString();
    final String imageUrl = agencie['imageUrl'];
    return Container(
      margin: const EdgeInsets.only(
        top: 18,
      ),  
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      padding: const EdgeInsets.all(
        14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            "\$ $price",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 14,
          ),
          // ignore: prefer_const_constructors
          Center(
            child: Image(
              height: 180,
              image: AssetImage(
                imageUrl,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
