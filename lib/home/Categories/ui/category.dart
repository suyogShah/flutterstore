import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:suyogstore/home/Categories/bloc/categories_bloc.dart';
import 'package:suyogstore/home/Categories/ui/category_widget.dart';




class Categorypage extends StatefulWidget {

  final String categories;
  const Categorypage({super.key, required this.categories});

  @override
  State<Categorypage> createState() => _CartState();
}

class _CartState extends State<Categorypage> {
  final CategoriesBloc categoriesBloc = CategoriesBloc();



  @override
  void initState() {
    categoriesBloc.add(CategoriesIntial(categories: widget.categories));
    print(widget.categories);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
      ),
      body: BlocConsumer<CategoriesBloc, CategoriesState>(
        bloc: categoriesBloc,
        listener: (context, state) {
          
        },
       
        builder: (context, state) {
          switch (state.runtimeType) {
            case CategoryDetailLoadedState:
              final successState = state as CategoryDetailLoadedState ;
              return ListView.builder(
                  itemCount: successState.product.length,
                  itemBuilder: (context, index) {
                    return CategoryWidget(
                        categoriesBloc: categoriesBloc,
                        productDataModel: successState.product[index],);
                  });

            default:
          }
          return Container();
        },
      ),
    );
  }
}