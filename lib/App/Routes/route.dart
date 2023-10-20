import 'package:flutter_app/Views/Home/homepage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) {
        return const RegisterView();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) {
        return const Login();
      },
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) {
        return const MainView();
      },
    ),
    GoRoute(
      path: '/about-me',
      builder: (context, state) {
        return const AboutMeView();
      },
    ),
    GoRoute(
      path: '/change-pass',
      builder: (context, state) {
        return const ChangePassView();
      },
    ),
    GoRoute(
      path: '/add-product',
      builder: (context, state) {
        return const AddProductView();
      },
    ),
    GoRoute(
      path: '/list-product',
      builder: (context, state) {
        return const ProductsListView();
      },
    ),
    GoRoute(
      path: '/change-product',
      builder: (context, state) {
        return const ChangeProductView();
      },
      redirect: (context, state) {
        ProductsController productsController = context.read<ProductsController>();
        if(productsController.barcodeController.text == '' && productsController.nameController.text == '' && productsController.priceController.text == '' && productsController.qtdController.text == '' && productsController.descController.text == '') {
          return '/main';
        }
        return null;
      },
    ),
  ],
);
