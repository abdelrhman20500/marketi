import 'package:flutter/material.dart';
import 'package:marketi/Features/home/presentation/view/widget/best_for_you_list_view.dart';
import 'package:marketi/Features/home/presentation/view/widget/brand_list_view.dart';
import 'package:marketi/Features/home/presentation/view/widget/build_carousel_slider.dart';
import 'package:marketi/Features/home/presentation/view/widget/build_home_search.dart';
import 'package:marketi/Features/home/presentation/view/widget/category_grid_view.dart';
import 'package:marketi/Features/home/presentation/view/widget/popular_product_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(radius: 24,
                    backgroundImage: NetworkImage(
                      "https://tse3.mm.bing.net/th/id/OIP.ZEXdghINz4HsKZe6BaVuEgHaJQ?rs=1&pid=ImgDetMain&o=7&rm=3",),),
                  SizedBox(width: width*0.05),
                  const Text("Hi Yousef !", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  const Spacer(),
                  IconButton(onPressed: () {},
                    icon: const Icon(Icons.notifications_active_outlined, color: Color(0xff3F80FF), size: 34,),),
                ],
              ),
              SizedBox(height: height*0.01,),
              const BuildHomeSearch(),
              SizedBox(height: height*0.01,),
              const BuildCarouselSlider(),
              SizedBox(height: height*0.01,),
              CustomTitleProduct(text1: "Product Popular", text2: "View all" ,onPressed: (){},),
              SizedBox(height: height*0.01,),
              const PopularProductListView(),
              CustomTitleProduct(text1: "Category", text2: "View all" ,onPressed: (){},),
              SizedBox(height: height*0.01,),
              const CategoryGridView(),
              SizedBox(height: height*0.01,),
              CustomTitleProduct(text1: "Best For You", text2: "View all" ,onPressed: (){},),
              SizedBox(height: height*0.01,),
              const BestForYouListView(),
              SizedBox(height: height*0.01,),
              CustomTitleProduct(text1: "Brands", text2: "View all" ,onPressed: (){},),
              const BrandListView(),
              SizedBox(height: height*0.01,),
              CustomTitleProduct(text1: "Buy Again", text2: "View all" ,onPressed: (){},),
              SizedBox(height: height*0.01,),
              const BestForYouListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTitleProduct extends StatelessWidget {
  const CustomTitleProduct({super.key, required this.text1, required this.text2, this.onPressed,});

  final String text1;
  final String text2;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
        TextButton(onPressed: onPressed, child: Text(text2, style: const TextStyle(fontSize: 20,
        fontWeight: FontWeight.w600,color: Color(0xff3F80FF)),))
      ],
    );
  }
}
