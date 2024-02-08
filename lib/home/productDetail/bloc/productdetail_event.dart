part of 'productdetail_bloc.dart';

@immutable
sealed class ProductdetailEvent {}


class ProductDetailInitial extends ProductdetailEvent {
  final int id;

  ProductDetailInitial({required this.id});

}


class ProductAddtoCartEvent extends ProductdetailEvent{
  final int userId;
  final String date;
  final List<Products> products;
  

  ProductAddtoCartEvent({required this.userId, required this.date, required this.products});




}

