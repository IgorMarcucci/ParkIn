// import 'package:flutter/material.dart';
// import 'package:flutter_app/Pages/Cliente/ClienteInterface/cliente_interface.dart';
// import 'package:flutter_app/Pages/Cliente/InfoPage/Widgets/separators_info.dart';
// import 'package:flutter_app/App/theme/custom_theme.dart';
// import 'package:provider/provider.dart';

// import '../../../App/controllers/user.controller.dart';

// class InfoPage extends StatelessWidget {
//   const InfoPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
//     UserController userController =
//         context.read<UserController>();
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Informações',
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(
//                     builder: (context) => const ClienteInterface()),
//                 (route) => false));
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.1,
//                 ),
//                 Center(
//                   child: Container(
//                     color: Colors.transparent,
//                     child: const Icon(
//                       Icons.account_circle_outlined,
//                       size: 200,
//                       color: Colors.black54,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.1,
//                 ),
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Nome: ${userController.name}',
//                         style: tema.textstyles,
//                       ),
//                       SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03),
//                       const Center(child: InfoSeparators()),
//                       SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03),
//                       Text(
//                         'Email: ${userController.email}',
//                         style: tema.textstyles,
//                       ),
//                       SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03),
//                       const Center(child: InfoSeparators()),
//                       SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03),
//                       Text(
//                         'Cidade: Dados de GPS não disponíveis',
//                         style: tema.textstyles,
//                       ),
//                       SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03),
//                       const Center(child: InfoSeparators()),
//                       SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03),
//                       Text(
//                         'Categoria: Cliente',
//                         style: tema.textstyles,
//                       ),
//                       SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.03),
//                       const Center(child: InfoSeparators()),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
