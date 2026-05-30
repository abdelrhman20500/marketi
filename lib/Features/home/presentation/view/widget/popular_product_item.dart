import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class PopularProductItem extends StatelessWidget {
  const PopularProductItem({super.key, required this.imageUrl, required this.title, required this.rating, required this.price});

  final String imageUrl;
  final String title;
  final double rating;
  final double price;
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    // var width= MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.fill,
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
                  Positioned(
                    right: 5.0,
                    top: 5.0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white.withOpacity(0.8),
                      child: const Icon(Icons.favorite, color: Colors.black,),),
                  ),
                ],
              ),
              SizedBox(height: height*0.01,),
               Row(
                children: [
                  Text("${price.toStringAsFixed(2)} EGP",
                      style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600)),
                  const Spacer(),
                  const Icon(Icons.star_border,),
                  Text(rating.toString(), style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(height:height * 0.01),
              Text(title,
                style: const TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height:height * 0.01),
              SizedBox(
                width: double.infinity,
                height: 38,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side:
                    const BorderSide(color: Color(0xFF3B82F6), width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3B82F6),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}