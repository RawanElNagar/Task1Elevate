// State class
import 'package:filtrationtask/Model.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<Product> products;

  ProductLoadedState({required this.products});
}

class ProductErrorState extends ProductState {
  final String message;

  ProductErrorState({required this.message});
}
