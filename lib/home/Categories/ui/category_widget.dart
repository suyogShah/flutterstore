import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:suyogstore/home/Categories/bloc/categories_bloc.dart';


import 'package:suyogstore/home/model/productmodel.dart';
import 'package:suyogstore/home/productDetail/ui/ProductDetail.dart';

class CategoryWidget extends StatelessWidget {
  final ProductModel productDataModel;
  final CategoriesBloc categoriesBloc;
  const CategoryWidget(
      {super.key, required this.productDataModel, required this.categoriesBloc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProductDeatialpage(id : productDataModel.id!)));

      },

      child: Container(
        width: 200,
        height: 350,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(alignment: Alignment.topRight,
                        onPressed: () {
                          // categoriesBloc.add(HomeProductWishlistButtonClickedEvent(clickedProduct: productDataModel));
                        },
                        icon: Icon(Icons.favorite_border)),
            Container(
              height:80,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(productDataModel.image!))
                  ),
            ),
            const SizedBox(height: 20),
            Text('${productDataModel.title}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            // Text('${productDataModel.description}'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$" + productDataModel.price.toString(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Icon(Icons.star),
                        Text(productDataModel.rating!.rate.toString()),
                       
                      ],
                    ),
                Row(
                  children: [
                    
                    IconButton(
                        onPressed: () {
                          // homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productDataModel));
                    
                        },
                        icon: Icon(Icons.shopping_bag_outlined)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
