import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/Home/homepage.dart';
import 'package:flutter_app/Widgets/scaffold_messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Pages/Cliente/ClienteInterface/cliente_interface.dart';
import '../../Pages/Funcionário/FuncionarioInterface/func_interface.dart';

class FirebaseFunctions {
  void loginCliente(context, email, password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((res) {
      sucesso(context, 'Usuário autenticado com sucesso.');
      Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ClienteInterface()),
          (route) => false));
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        case 'user-not-found':
          erro(context, 'Usuário não encontrado.');
          break;
        case 'wrong-password':
          erro(context, 'Senha incorreta.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }

  void loginFuncionario(context, email, password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((res) {
      sucesso(context, 'Funcionário autenticado com sucesso.');
      Future.microtask(() => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const FuncInterface()),
          (route) => false));
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        case 'user-not-found':
          erro(context, 'Usuário não encontrado.');
          break;
        case 'wrong-password':
          erro(context, 'Senha incorreta.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }

  Future<void> esqueceuSenha(context, email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false);
  }

  void criarContaCliente(context, email, password, name) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((res) {
      //Armazenar o nome no Firestore
      FirebaseFirestore.instance.collection('usuarios').add({
        "uid": res.user!.uid.toString(),
        "nome": name,
      });
      sucesso(context, 'Usuário criado com sucesso.');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const ClienteInterface()),
          (route) => false);
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          erro(context, 'O email já foi cadastrado.');
          break;
        case 'invalid-email':
          erro(context, 'O email é inválido.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }

  void criarContaFuncionario(context, email, password, name, cpf) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((res) {
      //Armazenar o nome no Firestore
      FirebaseFirestore.instance.collection('funcionarios').add({
        "uid": res.user!.uid.toString(),
        "nome": name,
        "cpf": cpf.toString(),
      });
      sucesso(context, 'Funcionário criado com sucesso.');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const FuncInterface()),
          (route) => false);
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          erro(context, 'O email já foi cadastrado.');
          break;
        case 'invalid-email':
          erro(context, 'O email é inválido.');
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  Future<String> retornaFuncionarioLogado() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    // ignore: prefer_typing_uninitialized_variables
    var res;
    await FirebaseFirestore.instance
        .collection('funcionarios')
        .where('uid', isEqualTo: uid)
        .get()
        .then(
      (q) {
        if (q.docs.isNotEmpty) {
          res = q.docs[0].data()['nome'];
        } else {
          res = "";
        }
      },
    );
    return res;
  }
}
