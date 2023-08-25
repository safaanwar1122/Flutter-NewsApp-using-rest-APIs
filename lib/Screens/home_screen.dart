import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Models/top_news_headlines.dart';
import '../Repository/news_repository.dart';
import '../View_Model/news_view_model.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum filterlist { bbcnews, aryNews, independent, reuters, AlJazera, cnn }

class _HomeScreenState extends State<HomeScreen> {
  final format = DateFormat('MMMM dd, yyyy');
  String name = 'bbc-news';

  TopNewsHeadlinesClass topNewsHeadlinesClass = TopNewsHeadlinesClass();
  filterlist? selectedMenu;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            'images/category_icon.png',
            height: 30,
            width: 30,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>CategoryScreen()));
          },
        ),
        centerTitle: true,
        title: Text(
          'News',
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        actions: [
          PopupMenuButton<filterlist>(
              onSelected: (filterlist item) {
                if (filterlist.bbcnews.name == item.name) {
                  name = 'bbc-news';
                }
                if (filterlist.aryNews.name == item.name) {
                  name = 'ary-news';
                }
                if (filterlist.AlJazera.name == item.name) {
                  name = 'al-jazeera-english';
                }
                if (filterlist.cnn.name == item.name) {
                  name = 'cnn';
                }

                setState(() {
                  selectedMenu = item;
                });
              },
              initialValue: selectedMenu,
              itemBuilder: (context) => <PopupMenuEntry<filterlist>>[
                PopupMenuItem<filterlist>(
                  value: filterlist.bbcnews,
                  child: Text('BBC news'),
                ),
                PopupMenuItem<filterlist>(
                  value: filterlist.aryNews,
                  child: Text('ARY news'),
                ),
                PopupMenuItem<filterlist>(
                  value: filterlist.AlJazera,
                  child: Text('AL-Jazeera news'),
                ),
                PopupMenuItem<filterlist>(
                  value: filterlist.cnn,
                  child: Text('CNN news'),
                ),
              ])
        ],
      ),
      body: ListView(children: [
        Container(
          height: height * .55,
          width: width,
          child: FutureBuilder<TopNewsHeadlines>(
              future: topNewsHeadlinesClass.getTopNewsHeadlines(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SpinKitFadingCube(
                      color: Colors.blue,
                      size: 50,
                    ),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: ( context, int index) {
                      DateTime dateTime = DateTime.parse(snapshot
                          .data!.articles![index].publishedAt
                          .toString());
                      return SizedBox(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: height * 0.6,
                              width: width * .9,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: height * .02),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: snapshot
                                        .data!.articles![index].urlToImage
                                        .toString(),
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.error_outline,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              child: Card(
                                color: Colors.white,
                                elevation: 5,
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  alignment: Alignment.bottomCenter,
                                  height: height * .22,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: width * 0.7,
                                        child: Text(
                                          snapshot.data!.articles![index].title
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: width * 0.7,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              snapshot.data!.articles![index]
                                                  .source!.name
                                                  .toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  color: Colors.blue,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text(
                                              format.format(dateTime),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              }),
        ),

      ]),
    );
  }
}
