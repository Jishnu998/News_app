import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/constants/constants.dart';
import 'package:provider/provider.dart';

import '../../controller/home screen controller.dart';

class NewsViewScreen extends StatelessWidget {
  const NewsViewScreen(
      {super.key,
        required this.title,
        required this.description,
        this.date,
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
    double size=constantsize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back_ios,color: widgetcolor,size: size*30,)),      ),
      body: Padding(
        padding:  EdgeInsets.all(size*15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                 TextStyle(fontSize: size*20, fontWeight: FontWeight.w700),
              ),
               SizedBox(
                height: size*20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      "$sourceName | ${DateFormat('dd/MM/yyyy').format(date!).toString()}")
                ],
              ),
               SizedBox(
                height: size*20,
              ),
              Container(
                height: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(size*10),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover)),
              ),
           SizedBox(
            height: size*20),
              Text(description!= "null"?
                "$description":"",
                style:
                 TextStyle(fontSize: size*18),
              ),
               SizedBox(
                height: size*30,
              ),
              SingleChildScrollView(
                child: Text( content!= "null"?
                  "$content": "",
                  style:
                   TextStyle(fontSize: size*15,),
                ),
              ),
               SizedBox(
                height: size*20,
              ),
              InkWell(
                onTap: () {
                  Provider.of<HomeScreenController>(context, listen: false)
                      .launchURL(url);
                },
                child:  Text(
                  "Click heare to Read more",
                  style: TextStyle(
                      fontSize: size*15,
                      fontStyle: FontStyle.italic,
                      color: widgetcolor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}