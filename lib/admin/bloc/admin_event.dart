part of 'admin_bloc.dart';

@immutable
sealed class AdminEvent {}




class ProductSaveButtonEvent extends AdminEvent{
  final String title;
  final int price;
  final String description;
  final String image;
  final String category;

  ProductSaveButtonEvent({required this.title, required this.price, required this.description, required this.image, required this.category});

}
