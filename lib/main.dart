import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/events.dart';
import 'cubit/view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Product List',
      home: BlocProvider(
        create: (context) => ProductBloc()..add(FetchProductsEvent()),
        child: ProductListScreen(),
      ),
    );
  }
}
