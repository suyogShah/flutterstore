import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:suyogstore/home/model/WishlistItem.dart';
import 'package:suyogstore/home/model/cartItems.dart';
import 'package:suyogstore/home/model/productmodel.dart';
import 'package:suyogstore/home/repo/repo.dart';

part 'home_event.dart';

part 'home_state.dart';




class HomeBloc extends Bloc<HomeEvent, HomeState> {
  
  
  HomeBloc() : super(HomeInitial()) {
     
  on<HomeInitialEvent>(homeIntialEvent);
  on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
   on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
    on<ProductDetailNavigateButton>(productDetailNavigateButton);
  }

  Future<FutureOr<void>> homeIntialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    final ProductRepo productRepo =
        ProductRepo();
   
    emit(HomeloadingState());
    try {
        final products = await productRepo.getShoppingItems();
        emit(HomeloadedState(products:products));
      } catch (e) {
        emit(HomeErrorState( error: e.toString(),));
        print("no no api ");
      }
    }

  
  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("carted");
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }
  
  FutureOr<void> homeProductWishlistButtonClickedEvent(HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("Carted");
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

    FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Wishlist Navigate clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart Navigate clicked');
    emit(HomeNavigateToCartPageActionState());
  }
  
  FutureOr<void> productDetailNavigateButton(ProductDetailNavigateButton event, Emitter<HomeState> emit) {
    emit(ProductDetailNavigatePage());
  }
  }

