import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/book.model.dart';
import 'package:whatsapp_clone/model/chapters.model.dart';
import 'package:whatsapp_clone/view/chapters.view.dart';

class MensagemItem extends StatelessWidget {
  final bookModel model;

  MensagemItem(this.model);

  @override
  Widget build(BuildContext context) {
    //final argumentos = ModalRoute.of(context)!.settings.arguments as bookModel;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    Chapters(chapterModel(model.chapters, model.abbrev)))));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(13, 7, 21, 7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: "Arial",
                      ))
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(model.chapters.toString()),
                SizedBox(
                  height: 4,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
