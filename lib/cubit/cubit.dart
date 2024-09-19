import 'package:filtrationtask/cubit/events.dart';
import 'package:filtrationtask/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Model.dart';

// Bloc class
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState());

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is FetchProductsEvent) {
      yield ProductLoadingState();

      try {
        final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
        if (response.statusCode == 200) {
          final List<dynamic> jsonList = json.decode(response.body);
          final List<Product> products = jsonList.map((json) => Product.fromJson(json)).toList();
          yield ProductLoadedState(products: products);
        } else {
          yield ProductErrorState(message: "Failed to load products");
        }
      } catch (error) {
        yield ProductErrorState(message: "An error occurred");
      }
    }
  }
}
