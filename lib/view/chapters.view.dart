import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/book.model.dart';
import 'package:whatsapp_clone/model/chapters.model.dart';
import 'package:whatsapp_clone/model/versicle.model.dart';
import 'package:whatsapp_clone/view/verses.view.dart';

class Chapters extends StatelessWidget {
  final chapterModel model;
  Chapters(this.model);

  @override
  Widget build(BuildContext context) {
    print(model.chapter);

    return ListView.builder(
        itemCount: model.chapter,
        itemBuilder: (BuildContext context, int index) {
          int chapter = index + 1;
          return Material(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => versesView(
                            verseModel(chapter, model.abbrev, "text", 0)))));
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
                          Text(chapter.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "Arial",
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
