import 'package:flutter/material.dart';
import 'package:news_app/screens/widgets/news%20card.dart';
import 'package:provider/provider.dart';
import '../constants/constants.dart';
import '../controller/search screen controller.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double size=constantsize(context);
    TextEditingController textController = TextEditingController();
    SearchScreenController provider = Provider.of<SearchScreenController>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(size*20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: size*45,
                      width: MediaQuery.sizeOf(context).width * 1.8 / 3,
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(size*10),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(size*10),
                              borderSide:  BorderSide(
                                  color: widgetcolor, width: size*3)),
                        ),
                      ),
                    ),
                     SizedBox(
                      width: size * 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          provider.searchData(searchText: textController.text.toLowerCase());
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                            MaterialStatePropertyAll(widgetcolor)),
                        child:  Text(
                          "Search",
                          style: TextStyle(color: Colors.white,fontSize: size*14),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: size*10),
              Divider(color: widgetcolor,),
              Expanded(
                child: Provider.of<SearchScreenController>(context).isLoading ==
                    true
                    ? Center(
                    child: CircularProgressIndicator())
                    : ListView.separated(
                    itemBuilder: (context, index) => NewsCard(
                        title:
                        provider.newsModel?.articles?[index].title ?? "",
                        description:
                        provider.newsModel?.articles?[index].description ??
                            "",
                        date:
                        provider.newsModel?.articles?[index].publishedAt,
                        imageUrl:
                        provider.newsModel?.articles?[index].urlToImage ??
                            "",
                        content: provider.newsModel?.articles?[index].content ??
                            "",
                        sourceName:
                        provider.newsModel?.articles?[index].source?.name ??
                            "",
                        url: provider.newsModel?.articles?[index].url ?? ""),
                    separatorBuilder: (context, index) =>  Divider(height: size*20),
                    itemCount: provider.newsModel?.articles?.length ?? 0),
              )
            ],
          )),
    );
  }
}