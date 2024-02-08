part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


class HomeInitialEvent extends HomeEvent{}




class HomeProductWishlistButtonClickedEvent extends HomeEvent {
  final ProductModel clickedProduct;
  HomeProductWishlistButtonClickedEvent({
    required this.clickedProduct,
  });
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final ProductModel clickedProduct;
  HomeProductCartButtonClickedEvent({
    required this.clickedProduct,
  });
  
}
class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}

class ProductDetailNavigateButton extends HomeEvent{
  final int id;

  ProductDetailNavigateButton({required this.id});
}



