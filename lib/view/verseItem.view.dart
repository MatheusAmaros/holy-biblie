import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/book.model.dart';
import 'package:whatsapp_clone/model/chapters.model.dart';
import 'package:whatsapp_clone/model/versicle.model.dart';
import 'package:whatsapp_clone/view/chapters.view.dart';

class verseItem extends StatelessWidget {
  final verseModel model;

  verseItem(this.model);

  @override
  Widget build(BuildContext context) {
    //final argumentos = ModalRoute.of(context)!.settings.arguments as bookModel;

    return Container(
      margin: const EdgeInsets.fromLTRB(13, 7, 21, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Wrap(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.number.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: "Arial",
                        )),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(model.text),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
