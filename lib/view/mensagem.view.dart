import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/book.model.dart';
import 'package:whatsapp_clone/view/mensagemItem.view.dart';

final dio = Dio();
Future<List> myHomePage () async{
  Response response = await dio.get("https://www.abibliadigital.com.br/api/books");

  return response.data;
} 


class MensagemView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List>(
          future: myHomePage(),
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Center(
                child: Text("Erro ao carregar os livros"),
              );
            }
            if(snapshot.hasData){
              return ListView.separated(
                separatorBuilder: (_,i) => Divider(),
                itemCount: snapshot.data!.length, 
                itemBuilder: (context, index) =>  MensagemItem(bookModel(snapshot.data![index]["abbrev"]["pt"], snapshot.data![index]["chapters"],snapshot.data![index]["name"],snapshot.data![index]["testament"])),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        )
        
        
          //mensagens.map((m) => MensagemItem(m)).toList()
        );
  }
}

