import 'package:filtrationtask/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit.dart';


class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Column(
        children: [
          // Add the Search Bar and Cart Button here
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "What do you search for?",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    // Handle cart action
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10),

          // BlocBuilder to display the product list
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoadingState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is ProductLoadedState) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(product.imageUrl, height: 150, fit: BoxFit.cover),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.title, style: TextStyle(fontWeight: FontWeight.bold), maxLines: 2,),
                                  SizedBox(height: 5),
                                  Text("\$${product.price}", style: TextStyle(color: Colors.green)),
                                  Row(
                                    children: [
                                      Text("${product.rating}"),
                                      Icon(Icons.star, color: Colors.yellow, size: 16),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is ProductErrorState) {
                  return Center(child: Text(state.message));
                } else {
                  return Center(child: Text('No Products Found'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
