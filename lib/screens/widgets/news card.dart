import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/constants/constants.dart';
import 'package:provider/provider.dart';
import '../../controller/home screen controller.dart';
import 'news view screen.dart';

class NewsCard extends StatelessWidget {
  const NewsCard(
      {super.key,
        required this.title,
        required this.description,
        required this.date,
        required this.imageUrl,
        required this.content,
        required this.sourceName,
        required this.url});

  final String title;
  final String description;
  final DateTime? date;
  final String imageUrl;
  final String content;
  final String sourceName;
  final String url;

  @override
  Widget build(BuildContext context) {
    double size= constantsize(context);
    return Container(
      padding:  EdgeInsets.all(size*15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size*10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: size*200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size*10),
              image: DecorationImage(
                  image: NetworkImage(
                    imageUrl,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
           SizedBox(
            height: size*10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsViewScreen(
                      title: title,
                      description: description,
                      imageUrl: imageUrl,
                      date: date,
                      content: content,
                      sourceName: sourceName,
                      url: url,
                    ),
                  ));
            },
            child: Column(
              children: [
                Text(
                  title,
                  style:  TextStyle(
                      fontSize: size*18, fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("$sourceName | ${DateFormat('dd/MM/yyyy').format(date!).toString() ?? ""}",
                        style:  TextStyle(
                            fontSize: size*15)),
                    IconButton(
                        onPressed: () {
                          String newsToShare = "$title \n \n $description \n \n $url";
                          Provider.of<HomeScreenController>(context, listen: false).shareText(textToShare: newsToShare);
                        },
                        icon:  Icon(Icons.share,size: size*30,))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}