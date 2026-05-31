import 'package:dartz/dartz.dart';
import 'package:marketi/Features/home/data/model/category_model.dart';
import 'package:marketi/Features/home/data/model/product_model.dart';

import '../../../../Core/error/failure.dart';
import '../../data/model/brands_model.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<ProductModel>>> getProduct();
  Future<Either<Failure, List<CategoryModel>>> getCategory();
  Future<Either<Failure, List<BrandsModel>>> getBrands();
}