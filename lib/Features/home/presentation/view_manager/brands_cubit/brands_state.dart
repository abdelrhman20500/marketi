import 'package:marketi/Features/home/data/model/brands_model.dart';

abstract class BrandsState{}
class BrandsInitial extends BrandsState{}
class BrandsLoading extends BrandsState{}
class BrandsFailure extends BrandsState{
  final String errMessage;

  BrandsFailure({required this.errMessage});
}
class BrandsSuccess extends BrandsState{
  final List<BrandsModel> brandsModel;

  BrandsSuccess({required this.brandsModel});
}