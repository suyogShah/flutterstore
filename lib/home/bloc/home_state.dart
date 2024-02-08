part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

 class HomeInitial extends HomeState {}

 abstract class HomeActionState extends HomeState {}

 class HomeloadingState extends HomeState{}

 class HomeloadedState extends HomeState{
  final List<ProductModel> products;

  HomeloadedState( {required this.products});

 }

class HomeErrorState extends HomeState{
  final String error;

  HomeErrorState({required this.error});

 
}
class HomeProductItemWishlistedActionState extends HomeActionState {

}


class HomeProductItemCartedActionState extends HomeActionState {}


class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class ProductDetailNavigatePage extends HomeState{} 