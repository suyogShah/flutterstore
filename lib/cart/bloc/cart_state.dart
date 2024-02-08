part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}



class CartLoadingState extends CartState{

}


class CartloadedState extends CartState{
  final List<ProductModel> cartItems;

  CartloadedState({required this.cartItems});
}
