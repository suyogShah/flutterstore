part of 'admin_bloc.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}

class  ProductSaveLoadingState extends AdminState{}


class ProductSuccesfulSavedState extends AdminState{}

class ProductSaveErrorState extends AdminState{
  final String error;

  ProductSaveErrorState({required this.error});

}



