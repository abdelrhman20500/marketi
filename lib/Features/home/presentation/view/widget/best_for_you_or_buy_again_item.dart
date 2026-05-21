import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BestForYouOrBuyAgainItem extends StatelessWidget {
  const BestForYouOrBuyAgainItem({super.key});

  final String image = "https://tse3.mm.bing.net/th/id/OIP.ZEXdghINz4HsKZe6BaVuEgHaJQ?rs=1&pid=ImgDetMain&o=7&rm=3";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
                      imageUrl: image,
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
                    top: 0,
                    left: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFFB3CFF3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: const Text(
                        '10% OFF',
                        style: TextStyle(
                          color: Color(0xFF1E3A8A),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5.0,
                    top: 5.0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white.withOpacity(0.8),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const Row(
                children: [
                  Text("799 El",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600)),
                  Spacer(),
                  Icon(
                    Icons.star_border,
                  ),
                  Text("(4.8)",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              const Text(
                "Smart watch",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: height*0.01,),
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
