import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/book.model.dart';
import 'package:whatsapp_clone/model/chapters.model.dart';
import 'package:whatsapp_clone/view/chapters.view.dart';
import 'package:whatsapp_clone/view/mensagem.view.dart';

class App extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MensagemView(),
    );
  }
}