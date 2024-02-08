import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:suyogstore/home/model/cartItems.dart';
import 'package:suyogstore/home/model/productmodel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    
    on<CartIntialEvent>(cartIntialEvent);
  }

  FutureOr<void> cartIntialEvent(CartIntialEvent event, Emitter<CartState> emit) {

    emit(CartloadedState(cartItems: cartItems));
  }
}
