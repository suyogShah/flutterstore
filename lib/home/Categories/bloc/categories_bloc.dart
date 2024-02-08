import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:suyogstore/home/model/productmodel.dart';
import 'package:suyogstore/home/repo/repo.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
on<CategoriesIntial>(categoriesIntial);
  }

final ProductRepo productRepo =
        ProductRepo();


  Future<FutureOr<void>> categoriesIntial(CategoriesIntial event, Emitter<CategoriesState> emit) async {
    emit(CategoryDetailLoadingState());
    try{
      final product=await productRepo.getShoppingItemsByCategory(event.categories);
     if (product.isNotEmpty) {
      emit(CategoryDetailLoadedState(product: product)); 
    } else {
      emit(CategoryDetailErrorState(error: 'Product not found'));
    }
  } catch (e) {
    emit(CategoryDetailErrorState(error: e.toString()));
  }
}
  }
