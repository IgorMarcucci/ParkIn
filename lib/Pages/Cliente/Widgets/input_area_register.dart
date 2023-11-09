// import 'package:flutter/material.dart';
// import 'package:flutter_app/App/controllers/user.controller.dart';
// import 'package:flutter_app/FormFields/input_email.dart';
// import 'package:flutter_app/FormFields/input_name.dart';
// import 'package:flutter_app/FormFields/input_password.dart';
// import 'package:provider/provider.dart';

// class InputAreaRegisterCliente extends StatelessWidget {
//   const InputAreaRegisterCliente({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     UserController userController = context.read<UserController>();
//     return Container(
//       padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
//       child: Column(
//         children: [
//           InputName(
//             icon: const Icon(Icons.person),
//             text: 'Informe seu nome',
//             nameController: userController.nameController,
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.015,
//           ),
//           InputEmail(
//             icon: const Icon(Icons.email),
//             text: "Informe seu email",
//             emailController: userController.emailController,
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.008,
//           ),
//           PasswordInput(
//             icon: const Icon(Icons.password),
//             input: 'Informe sua senha',
//             passwordController: userController.passwordController,
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.008,
//           ),
//           PasswordInput(
//             icon: const Icon(Icons.password),
//             input: 'Repita sua senha',
//             passwordController: userController.passwordConfirmController,
//           ),
//         ],
//       ),
//     );
//   }
// }
