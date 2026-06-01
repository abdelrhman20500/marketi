
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

class  ProductDetailsItem extends StatelessWidget {
  const  ProductDetailsItem({super.key, required this.model});

  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.03,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueAccent,width: 2,),),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl:model.thumbnail!,
                  fit: BoxFit.contain,
                  height: height * 0.34,
                  width: double.infinity,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[700]!,
                    highlightColor: Colors.grey[500]!,
                    child: Container(
                      height: height * 0.2,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(height: height * 0.02,),
            Row(
              children: [
                Expanded(child: Text(model.title!, style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600))),
                const Spacer(),
                RatingBar.builder(
                  initialRating: model.rating!.toDouble(),
                  minRating: 1,
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                Text(model.rating.toString(), style: const TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(height: height * 0.03,),
            const Text("Product Value", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
            SizedBox(height: height * 0.01,),
            ReadMoreText(model.description!,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
              trimMode: TrimMode.Line,
              trimLines: 4,
              colorClickableText: Colors.blue,
              trimCollapsedText: 'show more',
              trimExpandedText: 'show less',
              moreStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: height * 0.02),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F8FF),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Price',
                        style: TextStyle(fontSize: 14,color: Color(0xFF1E293B), fontWeight: FontWeight.w500,),),
                      SizedBox(height: height * 0.01,),
                      Text("${model.price!.toStringAsFixed(2)} EGP",
                        style: const TextStyle(fontSize: 18, color: Color(0xFF0F172A), fontWeight: FontWeight.bold,),),
                    ],
                  ),
                  SizedBox(width: width*0.2),
                  Expanded(
                    child: SizedBox(
                      height: height*0.06,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFF3B82F6),
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.add_shopping_cart_outlined, color: Color(0xFF3B82F6), size: 20,),
                            SizedBox(width: width*0.03),
                            const Text('Add to Cart', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: Color(0xFF3B82F6),),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
