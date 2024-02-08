import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suyogstore/cart/ui/cart.dart';
import 'package:suyogstore/home/Categories/ui/category.dart';

import 'package:suyogstore/home/bloc/home_bloc.dart';

import 'package:suyogstore/home/ui/producttile.dart';




class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  



  @override
  void initState() {
  
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
       listenWhen: (previous, current) => current is HomeActionState,
       buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        // } else if (state is HomeNavigateToWishlistPageActionState) {
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => Wishlist()));
        }else if(state is ProductDetailNavigatePage)
        {
           
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item Carted')));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Item Wishlisted')));
        }
        
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeloadingState:
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          case HomeloadedState:
            final successState = state as HomeloadedState;
            final Map<String, String> categories = {
  'electronics': 'Electronics',
  'jewelry': 'Jewelry',
  'mensClothing': "Men's Clothing",
  'womensClothing': "Women's Clothing",
};
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text('Suyog Store '),
                actions: [
                  IconButton(
                      onPressed: () {
                      },
                      icon: Icon(Icons.favorite_border)),
                  IconButton(
                      onPressed: () {
                          homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_cart)),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.shop_2_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded ),
            label: 'Profile',
          ),
          ],
        ),

              
              body: SingleChildScrollView(
                child: Column(
                  children: [Container(
                          padding: const EdgeInsets.all(16.0),
                          child: TextField(
                            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                fillColor: Colors.white70,
                            ),
                          ),
                        ),
                        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("images/banner.jpg"),
              ),
            ),
          ),
        ),
  
         
       Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    
                    itemCount: categories.values.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: ()
      {
         Navigator.push(
              context, MaterialPageRoute(builder: (context) => Categorypage(categories:categories.values.toString()[index])));
              print(categories.values.toList()[index]);
        

        },
          
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),color:Color.fromRGBO(0, 150, 136, 1),
                        ),
                        height: 150,
                        width: 150,
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text(categories.values.toList()[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                       
                      ),
                    ),
                  ),
                ),
            ]))),
        

SizedBox(height: 15),
                
                    GridView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return ProductTileWidget(
                              homeBloc: homeBloc,
                              productDataModel: successState.products[index]);
                        }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 1, crossAxisCount: 2,crossAxisSpacing: 2.0,mainAxisSpacing: 2.0),),
                  ],
                ),
              ),
            );

          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}
