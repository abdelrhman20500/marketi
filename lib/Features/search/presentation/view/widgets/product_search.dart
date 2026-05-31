import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductSearch extends StatelessWidget {
  const ProductSearch({super.key, required this.imageUrl, required this.name,
    required this.quantity, required this.price, required this.rating});

  final String imageUrl;
  final String name;
  final int quantity;
  final double price;
  final double rating;
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return Container(
      height: height*0.2,
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B82F6).withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 130,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFF1F5F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            padding: const EdgeInsets.all(8),
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                height: height * 0.2, // Adjust height
                width: double.infinity, // Full width
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  child: Container(
                    height: height * 0.2,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: Color(0xFF0F172A),),),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.favorite_border, color: Color(0xFF0F172A),size: 22,),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Text(quantity.toString(),
                    style: const TextStyle(fontSize: 14,color: Color(0xFF64748B), fontWeight: FontWeight.w500,),),
                  const Spacer(),
                  const Row(
                    children: [
                      Icon(
                        Icons.access_time_filled,
                        color: Color(0xFF3B82F6),
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Deliver in 60 mins',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF3B82F6),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${price.toStringAsFixed(2)} EGP",
                        style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color(0xFF0F172A),),),
                      Row(
                        children: [
                          const Icon(Icons.star_border, color: Color(0xFF1E3A8A), size: 16),
                          const SizedBox(width: 2),
                          Text(rating.toString(),
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A),),),
                        ],
                      ),
                      SizedBox(
                        width: 75,
                        height: 32,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Color(0xFF3B82F6), width: 1.2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: const Text('Add',
                            style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold, color: Color(0xFF3B82F6),),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}