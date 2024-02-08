import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:suyogstore/cart/model/cartModel.dart';
import 'package:suyogstore/home/model/productmodel.dart';
import 'package:suyogstore/home/repo/repo.dart';

part 'productdetail_event.dart';
part 'productdetail_state.dart';

class ProductdetailBloc extends Bloc<ProductdetailEvent, ProductdetailState> {
  ProductdetailBloc() : super(ProductdetailInitial()) {
     
    on<ProductDetailInitial>(productDetailInitial);
    on<ProductAddtoCartEvent>(productAddtoCartEvent);
  }
   final ProductRepo productRepo =
        ProductRepo();

  Future<FutureOr<void>> productDetailInitial(ProductDetailInitial event, Emitter<ProductdetailState> emit) async {
    emit(ProductDetailLoadingState());
    try{
      final product=await productRepo.getShoppingItemById(event.id);
     if (product != null) {
      emit(ProductDetailLoadedState(product: product)); 
    } else {
      emit(ProductDetailErrorState(error: 'Product not found'));
    }
  } catch (e) {
    emit(ProductDetailErrorState(error: e.toString()));
  }
}


  Future<FutureOr<void>> productAddtoCartEvent(ProductAddtoCartEvent event, Emitter<ProductdetailState> emit) async {   
    
    try {
    final CartModel? success = await productRepo.addToCart(event.userId, event.date, event.products);
    if (success != null) {
      emit(ProductAddedToCart());
    } else {
      emit(ProductAddedToCartEror(error: 'Failed to add items to the cart'));
    }
  } catch (e) {
    emit(ProductAddedToCartEror(error: 'An error occurred: $e'));
  }
}

  }

