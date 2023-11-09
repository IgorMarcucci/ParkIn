// import 'dart:developer';

// import 'package:flutter/material.dart';

// import 'package:flutter_app/App/controllers/user.controller.dart';
// import 'package:flutter_app/App/controllers/firebase.controller.dart';
// import 'package:flutter_app/Pages/Cliente/Widgets/input_area_login.dart';
// import 'package:flutter_app/Pages/Cliente/cliente_page.dart';
// import 'package:flutter_app/Widgets/line_title_page.dart';
// import 'package:flutter_app/Widgets/main_button.dart';
// import 'package:flutter_app/Widgets/park_in_area_register.dart';
// import 'package:flutter_app/App/theme/custom_theme.dart';
// import 'package:flutter_app/main.dart';
// import 'package:provider/provider.dart';

// class LoginPageCliente extends StatefulWidget {
//   const LoginPageCliente({super.key});

//   @override
//   State<LoginPageCliente> createState() => _LoginPageClienteState();
// }

// class _LoginPageClienteState extends State<LoginPageCliente> {
//   @override
//   Widget build(BuildContext context) {
//     UserController userController = context.read<UserController>();
//     log('Login page cliente - Build');
//     final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: tema.decorationButton,
//         child: Form(
//           key: formKey,
//           child: ListView(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.30,
//                 color: const Color.fromARGB(0, 207, 54, 54),
//                 child: Center(
//                   child: ParkInAreaGlobal(
//                     textInput: 'Login',
//                     callback: () {
//                       Future.microtask(() {
//                         userController.clearControllers();
//                         Navigator.of(context).pushAndRemoveUntil(
//                             MaterialPageRoute(
//                                 builder: (context) => const ClientePage()),
//                             (route) => false);
//                       });
//                     },
//                     icon: const Icon(Icons.keyboard_return),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 0.70,
//                 decoration: tema.paletteDecoration,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     const LineTitlePage(text: 'Cliente:'),
//                     const InputAreaLoginCliente(),
//                     MainButton(
//                       height: 50,
//                       width: MediaQuery.of(context).size.width * 0.7,
//                       text: 'Fazer login',
//                       callback: () {
//                         if (formKey.currentState!.validate()) {
//                           userController.setDataFromControllers();
//                           FirebaseFunctions().loginCliente(context,
//                               userController.email, userController.password);
//                           userController.clearControllers();
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
