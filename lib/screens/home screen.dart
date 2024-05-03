import 'package:flutter/material.dart';
import 'package:news_app/screens/search%20screen.dart';
import 'package:news_app/screens/widgets/news%20card.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../controller/home screen controller.dart';

class HomeScreen extends StatelessWidget {

  void fetchData(BuildContext context) {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    double size=constantsize(context);
    fetchData(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: size*5,centerTitle: true,
          title:  Text(
            "News Today",
          ),
          titleTextStyle:  TextStyle(
              color: widgetcolor, fontSize: size*25,
              fontWeight: FontWeight.w600),
          shadowColor: widgetcolor,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
              icon: Icon(Icons.search,size: size*30,),
            )
          ],
        ),
        body: Consumer<HomeScreenController>(builder: (context, provider, child) {
          return provider.isLoading == true
              ? Center(
              child: CircularProgressIndicator())
              : Padding(
            padding:  EdgeInsets.all(size*10),
            child: ListView.separated(
                itemBuilder: (context, index) => NewsCard(
                  title: provider.newsModel.articles?[index].title.toString() ?? "",
                  description: provider.newsModel.articles?[index].description
                      .toString() ??
                      "",
                  date:
                  provider.newsModel.articles?[index].publishedAt,
                  imageUrl: provider
                      .newsModel.articles?[index].urlToImage
                      .toString() ??
                      "",
                  content: provider.newsModel.articles?[index].content
                      .toString() ??
                      "",
                  sourceName: provider
                      .newsModel.articles?[index].source?.name
                      .toString() ??
                      "",
                  url: provider.newsModel.articles?[index].url
                      .toString() ??
                      "",
                ),
                separatorBuilder: (context, index) =>  Divider(
                  height: size*20,
                ),
                itemCount: provider.newsModel.articles?.length ?? 0),
          );
        }));
  }
}