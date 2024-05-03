import 'package:flutter/material.dart';
import 'package:news_app/screens/widgets/news%20card.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../controller/category controller.dart';

class CategoryScreen extends StatelessWidget {
  void fetchData(BuildContext context) async {
    Provider.of<CategoryController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    double size=constantsize(context);
    fetchData(context); // Call fetchData in build method (consider whether it's needed here)

    return Consumer<CategoryController>(
      builder: (context, provider, child) {
        return DefaultTabController(
          length: provider.categoryList.length,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              titleTextStyle:  TextStyle(
                  color: Colors.redAccent,
                  fontSize: size*20,
                  fontWeight: FontWeight.w600),
              title: const Text("Categories"),
              bottom: TabBar(
                labelStyle: const TextStyle(
                    color: widgetcolor, fontWeight: FontWeight.w600),
                labelColor: Colors.white,
                unselectedLabelColor:  widgetcolor,
                indicatorPadding:  EdgeInsets.symmetric(horizontal: size*5),
                unselectedLabelStyle:  TextStyle(
                    color: widgetcolor,
                    fontSize: size*15,
                    fontWeight: FontWeight.w500),
                overlayColor: const MaterialStatePropertyAll(Colors.grey),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    color:  widgetcolor,
                    borderRadius: BorderRadius.circular(size*10)),
                isScrollable: true,
                tabs: List.generate(
                  provider.categoryList.length,
                      (index) => Tab(
                    text: provider.categoryList[index],
                  ),
                ),
                onTap: (value) {
                  provider.onTap(index: value);
                },
              ),
            ),
            body: provider.isLoading == true
                ? Center(
                child: CircularProgressIndicator())
                : Padding(
              padding: EdgeInsets.all(size*10),
              child: ListView.separated(
                  itemBuilder: (context, index) => NewsCard(
                    title: provider.newsModel.articles?[index].title
                        .toString() ??
                        "",
                    description: provider
                        .newsModel.articles?[index].description
                        .toString() ??
                        "",
                    date: provider
                        .newsModel.articles?[index].publishedAt,
                    imageUrl: provider
                        .newsModel.articles?[index].urlToImage
                        .toString() ??
                        "",
                    content: provider
                        .newsModel.articles?[index].content
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
            ),
          ),
        );
      },
    );
  }
}