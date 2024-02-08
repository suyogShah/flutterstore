part of 'categories_bloc.dart';

@immutable
sealed class CategoriesEvent {}



class CategoriesIntial extends CategoriesEvent{
  final String categories;

  CategoriesIntial({required this.categories});
}