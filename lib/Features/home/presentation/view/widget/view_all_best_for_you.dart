import 'package:flutter/material.dart';
import 'package:marketi/Features/home/presentation/view/widget/view_all_popular_product_Grid_view.dart';
import '../../../../layout/presentation/view/layout_screen.dart';
import 'build_home_search.dart';

class ViewAllBestForYou extends StatelessWidget {
  const ViewAllBestForYou({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => LayoutScreen(),
              ),
                  (route) => false,
            );
          }, icon: const Icon(Icons.arrow_back_ios),),
        title: const Text("Best For You",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(radius: 20,
              backgroundImage: NetworkImage(
                "https://tse3.mm.bing.net/th/id/OIP.ZEXdghINz4HsKZe6BaVuEgHaJQ?rs=1&pid=ImgDetMain&o=7&rm=3",),),
          ),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.01),
                  const BuildHomeSearch(),
                  SizedBox(height: height * 0.02),
                  const Text("All Product",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            sliver: ViewAllGridView(),
          ),
        ],
      ),
    );
  }
}