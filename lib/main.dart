import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/Core/Api/dio_consumer.dart';
import 'package:marketi/Features/favorite/data/data_source/favorite_remote_data_source.dart';
import 'package:marketi/Features/favorite/data/repo/favorite_repo_impl.dart';
import 'package:marketi/Features/favorite/domain/use_case/add_to_favorite_use_case.dart';
import 'package:marketi/Features/favorite/domain/use_case/favorite_use_case.dart';
import 'package:marketi/Features/favorite/domain/use_case/remove_favorite_use_case.dart';
import 'package:marketi/Features/favorite/presentation/%20view_manager/favorite_cubit/favorite_cubit.dart';
import 'package:marketi/Features/layout/presentation/view/layout_screen.dart';
import 'Core/Api/simple_bloc_observer.dart';
import 'Core/cached/shared_pref.dart';
import 'Features/splash/presentation/view/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  Bloc.observer= SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(
        AddToFavoriteUseCase(FavoriteRepoImpl(
          favoriteBaseRemoteDataSource: AddToFavoriteRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())),
        )),
        RemoveFavoriteUseCase(FavoriteRepoImpl(
          favoriteBaseRemoteDataSource: AddToFavoriteRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())),
        )),
        FavoriteUseCase(FavoriteRepoImpl(
          favoriteBaseRemoteDataSource: AddToFavoriteRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())),
        )),
      )..getFavorite(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SharedPref.getToken() == null ? const SplashScreen() : LayoutScreen(),
      ),
    );
  }
}
