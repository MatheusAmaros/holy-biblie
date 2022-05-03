import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/book.model.dart';
import 'package:whatsapp_clone/model/versicle.model.dart';
import 'package:whatsapp_clone/view/mensagemItem.view.dart';
import 'package:whatsapp_clone/view/verseItem.view.dart';

final dio = Dio();


class versesView extends StatelessWidget {
  final verseModel model;
  versesView(this.model);
  

  Future<List> myVerses () async{
  Response response = await dio.get("https://www.abibliadigital.com.br/api/verses/nvi/"+model.abbrev+"/"+model.chapter.toString());
  
  return response.data["verses"];
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List>(
          future: myVerses(),
          builder: (context, snapshot){
            if(snapshot.hasError){
              return Center(
                child: Text("Erro ao carregar os versos"),
              );
            }
            if(snapshot.hasData){
              return ListView.separated(
                separatorBuilder: (_,i) => Divider(),
                itemCount: snapshot.data!.length, 
                itemBuilder: (context, index) =>  verseItem(verseModel(model.chapter, model.abbrev ,snapshot.data![index]["text"],snapshot.data![index]["number"])),
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

