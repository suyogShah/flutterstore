part of 'productdetail_bloc.dart';

@immutable
sealed class ProductdetailState {}

final class ProductdetailInitial extends ProductdetailState {}

abstract class ProductActionState extends ProductdetailState {}

 class ProductDetailLoadingState extends ProductdetailState {}

 class ProductDetailLoadedState extends ProductdetailState{

final ProductModel product;

  ProductDetailLoadedState( {required this.product});

 }

class ProductDetailErrorState extends ProductdetailState{
  final String error;

  ProductDetailErrorState({required this.error});

 
}

class ProductAddedToCart extends ProductActionState{}

class ProductAddedToCartEror extends ProductdetailState{
  final String error;

  ProductAddedToCartEror({required this.error});

}

 

