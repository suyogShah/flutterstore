import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:suyogstore/Login/bloc/loginauth_bloc.dart';
import 'package:suyogstore/cart/model/cartModel.dart';
import 'package:suyogstore/home/model/productmodel.dart';
import 'package:suyogstore/home/productDetail/bloc/productdetail_bloc.dart';

class ProductDeatialpage extends StatefulWidget {
  final int id;

  
 const ProductDeatialpage({Key? key, required this.id}) : super(key: key);

  

  @override
  State<ProductDeatialpage> createState() => _ProductDeatialpageState();
  
}

class _ProductDeatialpageState extends State<ProductDeatialpage> {
  final ProductdetailBloc _productdetailBloc = ProductdetailBloc();

  void initState() {
    _productdetailBloc.add(ProductDetailInitial(id: widget.id));
    print(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductdetailBloc, ProductdetailState>(

      bloc: _productdetailBloc,
       listenWhen: (previous, current) => current is ProductActionState,
       buildWhen: (previous, current) => current is! ProductActionState,
      
      listener: (context, state) {
         if (state is ProductAddedToCart)
         {
                        print('ProductAddedToCart state received');
      ScaffoldMessenger.of(context)
         .showSnackBar(SnackBar(content: Text('Item Carted')));
         }else if (state is ProductAddedToCartEror)
         {
                             print('ProductAddedToCart state received');
      ScaffoldMessenger.of(context)
         .showSnackBar(SnackBar(content: Text('Item  cannot be Carted')));
         }
      },
      builder: (context, state) {
        if(state is ProductDetailLoadedState)
        {
            final ProductModel product = state.product;
        return Scaffold(
          appBar: AppBar(
            title: Text('${product.title}'),
            
    



          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child:
              Column(children:[
              Container(

              height:350,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(product.image!))
                  ),
          
                


              ),
              SizedBox(height: 12,),
              Text(' ${product.title}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),

              SizedBox(height: 12,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
               ),
          
              Text(' ${product.description}'),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children:[
                  Text('Rs  ${product.price}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                  ElevatedButton(
                  onPressed: () {
                    DateTime now = DateTime.now();
                   String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
                   Products productItem = Products(productId: product.id, quantity: 1);
                  List<Products> productList = [productItem];
                  
                  _productdetailBloc.add(ProductAddtoCartEvent(userId:12, date:formattedDate , products:productList));
                  },
                  child: Text("Add to Cart"),
                  
                ),
               
                
                
                 ] ),
              )
             ] ),
              // Add more product details widgets here
          )],
         ) );
        }
      else if(state is ProductDetailLoadingState){
        return  Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));

      }   
      return Container();
      },
    );
}
}