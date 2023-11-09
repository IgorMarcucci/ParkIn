// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_app/App/controllers/user.controller.dart';
// import 'package:flutter_app/App/controllers/firebase.controller.dart';
// import 'package:flutter_app/App/theme/custom_theme.dart';
// import 'package:flutter_app/FormFields/input_name.dart';
// import 'package:flutter_app/Pages/Funcion%C3%A1rio/ListaVagas/list_veiculos.dart';
// import 'package:flutter_app/Widgets/main_button.dart';
// import 'package:provider/provider.dart';

// import '../../Cliente/InfoPage/Widgets/separators_info.dart';

// class CarroPage extends StatelessWidget {
//   const CarroPage({super.key, required this.index});

//   final int index;

//   @override
//   Widget build(BuildContext context) {
//     var uid = FirebaseAuth.instance.currentUser!.uid;
//     UserController userController = context.watch<UserController>();
//     FuncInterfaceModel interfaceModel = context.read<FuncInterfaceModel>();
//     final CustomTheme tema = Theme.of(context).extension<CustomTheme>()!;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Informações do usuário'),
//         leading: IconButton(
//           onPressed: () {
//             Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(builder: (context) => const ListaVagasPage()),
//                 (route) => false));
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: FutureBuilder(
//         future: FirebaseFirestore.instance
//             .collection('funcionarios')
//             .where('uid', isEqualTo: uid)
//             .get()
//             .then((value) {
//           if (value.docs.isNotEmpty) {
//             userController.setNameAndEmailData(
//               value.docs[0].data()['nome'],
//             );
//           }
//         }),
//         builder: (context, snapshot) {
//           return ListView(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.1,
//                     ),
//                     Center(
//                       child: Container(
//                         color: Colors.transparent,
//                         child: const Icon(
//                           Icons.account_circle_outlined,
//                           size: 200,
//                           color: Colors.black54,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.1,
//                     ),
//                     Container(
//                       margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text('Nome: ${userController.name}', style: tema.textstyles),
//                               IconButton(
//                                 onPressed: (){
//                                   showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       // retorna um objeto do tipo Dialog
//                                       return AlertDialog(
//                                         title: const Text("Alterar nome"),
//                                         content: SingleChildScrollView(
//                                           child: ListBody(
//                                             children: [
//                                               InputName(
//                                                 icon: const Icon(Icons.person, color: Colors.black87,),
//                                                 text: 'Insira o novo nome',
//                                                 nameController: userController.nameController,
//                                               ),
//                                               SizedBox(
//                                                 height: MediaQuery.of(context).size.height * 0.02,
//                                               ),
//                                               Center(
//                                                 child: MainButton(
//                                                   text: 'Alterar',
//                                                   callback: (){
//                                                     FirebaseFunctions().updateName(context, userController.nameController.text);
//                                                     userController.clearControllers();
//                                                   },
//                                                   height: 50,
//                                                   width: MediaQuery.of(context).size.width * 0.4,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       );
//                                     }
//                                   );
//                                 },
//                                 icon: const Icon(Icons.edit, color: Colors.black87,),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.03,
//                           ),
//                           const Center(child: InfoSeparators()),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.03,
//                           ),
//                           Text('Cidade: -------------', style: tema.textstyles,),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.08,
//                           ),
//                           Center(
//                             child: Text('Informações do veículo:', style: tema.textstylesTitle,),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.08,
//                           ),
//                           Text('Placa: ${interfaceModel.placa[index]}', style: tema.textstyles),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.03,
//                           ),
//                           const Center(child: InfoSeparators()),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.03,
//                           ),
//                           Text('Modelo: ${interfaceModel.modelo[index]}', style: tema.textstyles),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.03,
//                           ),
//                           const Center(child: InfoSeparators()),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.03,
//                           ),
//                           Text('Marca: ${interfaceModel.marca[index]}', style: tema.textstyles),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.03,
//                           ),
//                           const Center(child: InfoSeparators()),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height * 0.03,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }