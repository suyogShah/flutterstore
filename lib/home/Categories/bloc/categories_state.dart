part of 'categories_bloc.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}


class CategoryDetailLoadingState extends CategoriesState {}

 class CategoryDetailLoadedState extends CategoriesState{

final List<ProductModel> product;

  CategoryDetailLoadedState( {required this.product});

 }

class CategoryDetailErrorState extends CategoriesState{
  final String error;

  CategoryDetailErrorState({required this.error});

 
}