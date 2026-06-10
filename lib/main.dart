import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Core/Api/dio_consumer.dart';
import 'package:marketi/Features/layout/presentation/view/layout_screen.dart';
import 'package:marketi/Features/menu/data/data_source/user_remote_data_source.dart';
import 'package:marketi/Features/menu/data/repo/user_repo_impl.dart';
import 'package:marketi/Features/menu/domain/use_case/user_use_case.dart';
import 'package:marketi/Features/menu/presentation/view_manager/user_cubit.dart';
import 'Core/Api/simple_bloc_observer.dart';
import 'Core/cached/shared_pref.dart';
import 'Features/cart/data/data_source/cart_remote_data_source.dart';
import 'Features/cart/data/repo/cart_repo_impl.dart';
import 'Features/cart/domain/use_case/add_cart_use_case.dart';
import 'Features/cart/domain/use_case/cart_use_case.dart';
import 'Features/cart/domain/use_case/remove_cart_use_case.dart';
import 'Features/cart/presentation/view_manager/cart_cubit/cart_cubit.dart';
import 'Features/favorite/data/data_source/favorite_remote_data_source.dart';
import 'Features/favorite/data/repo/favorite_repo_impl.dart';
import 'Features/favorite/domain/use_case/add_to_favorite_use_case.dart';
import 'Features/favorite/domain/use_case/favorite_use_case.dart';
import 'Features/favorite/domain/use_case/remove_favorite_use_case.dart';
import 'Features/favorite/presentation/ view_manager/favorite_cubit/favorite_cubit.dart';
import 'Features/splash/presentation/view/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  Bloc.observer= SimpleBlocObserver();
  // UserCubit(UserUseCase(UserRepoImpl(userBaseRemoteDataSource:
  // UserRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())))))..getUserData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:(context) => UserCubit(UserUseCase(UserRepoImpl(userBaseRemoteDataSource:
          UserRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())))))..getUserData() ,
        ),
        BlocProvider(create: (context) =>  FavoriteCubit(
         AddToFavoriteUseCase(FavoriteRepoImpl(
           favoriteBaseRemoteDataSource: AddToFavoriteRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())),
         )),
         RemoveFavoriteUseCase(FavoriteRepoImpl(
           favoriteBaseRemoteDataSource: AddToFavoriteRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())),
         )),
         FavoriteUseCase(FavoriteRepoImpl(
           favoriteBaseRemoteDataSource: AddToFavoriteRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())),
         )),
       )..getFavorite(),),
        BlocProvider(create: (context) => CartCubit(
        AddCartUseCase(CartRepoImpl(cartBaseRemoteDataSource: CartRemoteDataSource(apiConsumer:
        DioConsumer(dio: Dio())))),
        RemoveCartUseCase(CartRepoImpl(cartBaseRemoteDataSource: CartRemoteDataSource(apiConsumer:
        DioConsumer(dio: Dio())))),
        CartUseCase(CartRepoImpl(cartBaseRemoteDataSource: CartRemoteDataSource(apiConsumer:
        DioConsumer(dio: Dio())))))..getCart(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SharedPref.getToken() == null ? const SplashScreen() : LayoutScreen(),
      ),
    );
  }
}
