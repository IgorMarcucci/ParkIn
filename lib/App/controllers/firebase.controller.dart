import 'package:flutter/material.dart';
import 'package:flutter_app/App/Models/user.model.dart';
import 'package:flutter_app/App/services/storage.dart';
import 'package:flutter_app/Widgets/scaffold_messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirebaseController {
  StorageData storageData = StorageData();

  void loginAccount(BuildContext context, UserModel user) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: user.email!, password: user.password!)
        .then((UserCredential res) async {
      await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: res.user!.uid)
          .get()
          .then(
        (q) {
          if (q.docs.isNotEmpty && res.user != null) {
            message(context, 'Usuário autenticado com sucesso.');
            var data = {
              "uid": res.user!.uid,
              "username": q.docs[0].data()['username'],
              "email": res.user!.email,
            };
            storageData.saveData(data, 'userData');
            
          } else {
            message(context, 'Usuário não encontrado');
          }
        },
      );
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          message(context, 'O formato do email é inválido.');
          break;
        case 'user-not-found':
          message(context, 'Usuário não encontrado.');
          break;
        case 'wrong-password':
          message(context, 'Senha incorreta.');
          break;
        case 'invalid-login-credentials':
          message(context, 'Credenciais de login inválidas.');
          break;
        default:
          message(context, e.code.toString());
      }
    });
  }

  Future<void> forgetPass(BuildContext context, UserModel user) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: user.email!);
      if (context.mounted) {
        message(context, 'Email enviado com sucesso');
      }
    } catch (e) {
      if (context.mounted) {
        message(context, 'Erro ao enviar email: $e');
      }
    }
  }

  void createAccount(BuildContext context, UserModel user) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: user.email!, password: user.password!)
        .then((res) {
      user.uid = res.user!.uid;
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(user.toJson());
      message(context, 'Usuário criado com sucesso.');
      
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          message(context, 'O email já foi cadastrado.');
          break;
        case 'invalid-email':
          message(context, 'O email é inválido.');
          break;
        default:
          message(context, e.code.toString());
      }
    });
  }

  void updateFunction(BuildContext context, Map<String, dynamic> body) async {
    FirebaseFirestore.instance
        .collection(body['collection'])
        .doc(body['document'])
        .update(body['body'])
        .then((value) {message(context, 'Operação realizada com sucesso');
        })
        .catchError((e) {
      message(context, 'Operação mal sucedida');
    });
  }

  void postFunction(BuildContext context, Map<String, dynamic> body) async {
    await FirebaseFirestore.instance
        .collection(body['collection'])
        .doc(body['document'])
        .set(
          body['body'],
        )
        .then((value) {
      message(context, 'Operação realizada com sucesso');
    }).catchError((e) {
      message(context, 'Operação mal sucedida');
    });
  }

  void deleteFunction(context, Map<String, dynamic> body) {
    FirebaseFirestore.instance
        .collection(body['collection'])
        .doc(body['document'])
        .delete()
        .then((res) {
      message(context, 'Operação realizada com sucesso');
    }).catchError((e) {
      message(context, 'Operação mal sucedida');
    });
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String> returnLoggedUser() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    // ignore: prefer_typing_uninitialized_variables
    var res;
    await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .get()
        .then(
      (q) {
        if (q.docs.isNotEmpty) {
          res = q.docs[0].data()['name'];
        } else {
          res = "";
        }
      },
    );
    return res;
  }

  Future<List<QueryDocumentSnapshot>> getData<T>(
      UserModel user, String collection) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection(collection)
          .where('uid', isEqualTo: user.uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}