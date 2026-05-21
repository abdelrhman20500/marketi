import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Features/cart/presentation/view/cart_screen.dart';
import 'package:marketi/Features/menu/presentation/view/menu_screen.dart';
import '../../../favorite/presentation/view/favorite_screen.dart';
import '../../../home/presentation/view/home_screen.dart';
import '../view_manager/nav_bar_cubit.dart';
import '../view_manager/nav_bar_state.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});
  static const String routeName = "LayoutScreen";

  final List<Widget> tabs = [
    const HomeScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<NavBarCubit>(context);
          return Scaffold(
            body: SafeArea(
              child: tabs[cubit.currentIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Shopping"),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
              ],
            ),
          );
        },
      ),
    );
  }
}
