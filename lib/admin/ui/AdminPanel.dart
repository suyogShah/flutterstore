  import 'package:flutter/material.dart';
import 'package:suyogstore/home/bloc/home_bloc.dart';
import 'package:suyogstore/home/model/productmodel.dart';




class ProductTable extends StatelessWidget {
  final List<ProductModel> products;
  final HomeBloc homeBloc=HomeBloc();

  ProductTable(this.products);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Product ID')),
        DataColumn(label: Text('Product Name')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Actions')),
      ],
      rows: products.map((product) {
        return DataRow(
          cells: [
            DataCell(Text(product.id.toString())),
            DataCell(Text(product.title!)),
            DataCell(Text('\$'+ product.price!.toStringAsFixed(2))),
            DataCell(
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: (){}
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {}
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}