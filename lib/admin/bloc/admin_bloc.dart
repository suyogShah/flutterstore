import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:suyogstore/home/repo/repo.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(AdminInitial()) {

    on<ProductSaveButtonEvent>(productSaveButtonEvent);
    }
  
  Future<FutureOr<void>> productSaveButtonEvent(ProductSaveButtonEvent event, Emitter<AdminState> emit) async {
     final ProductRepo productRepo =
        ProductRepo();
           emit(ProductSaveLoadingState());
       
        try{
        final products = await productRepo.createShoppingItems(event.title,event.price.toDouble(),event.description,event.image,event.category);
        if(products.id!=null)
        {
      
        emit(ProductSuccesfulSavedState());
        }
        }catch(e)
        {
      
        emit(ProductSaveErrorState( error: e.toString()));
        }
      
      }
  }


