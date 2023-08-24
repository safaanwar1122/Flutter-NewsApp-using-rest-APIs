import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import '../Models/top_news_headlines.dart';
import '../Repository/news_repository.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TopNewsHeadlinesClass topNewsHeadlinesClass = TopNewsHeadlinesClass();
  //late Future<TopNewsHeadlinesClass> topNewsHeadlinesClass;
  final format = DateFormat('MMMM dd, yyyy');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // topNewsHeadlinesClass=getTopNewsHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoryScreen()));
            },
            icon: Image.asset('images/category_icon.png'),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flutter',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30,
                  color: Colors.red,
                ),
              ),
              Text(
                'NewsApp  ',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) => [
                      const PopupMenuItem(value: 1, child: Text('BBC news')),
                      const PopupMenuItem(
                          value: 2, child: Text('Al-Jazeera-english news')),
                      const PopupMenuItem(value: 3, child: Text('CNN news')),
                      const PopupMenuItem(
                          value: 4, child: Text('Independent news')),
                      const PopupMenuItem(value: 5, child: Text('Ary news')),
                    ]),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<TopNewsHeadlines>(
                  future: topNewsHeadlinesClass.getTopNewsHeadlines(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SpinKitFadingCube(
                        color: Colors.blue,
                        size: 50,
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot!.data!.articles?.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          DateTime dateTime = DateTime.parse(snapshot
                              .data!.articles![index].publishedAt
                              .toString());
                          return Padding(
                            //this padding is around card not inside of card
                            padding: const EdgeInsets.all(20.0),
                            child: Card(
                              //color: Colors.blue,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: EdgeInsets.only(right: 5),
                              child: Container(
                                padding: EdgeInsets.all(0),
                                width: 400,
                                height: 300,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: SizedBox(
                                    height: 170,
                                    width: double.infinity,
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: snapshot.data!
                                                .articles![index].urlToImage
                                                .toString(),
                                            errorWidget:
                                                (context, url, error) => const Icon(
                                              Icons.error_outline,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            //bottom: 5,
                                            child: SingleChildScrollView(
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            margin: const EdgeInsets.fromLTRB(
                                                20, 200, 20, 20),
                                            child: Expanded(
                                              child: Container(
                                                height: 200,
                                                // color: Colors.red,
                                                width: double.infinity,
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Flexible(
                                                    flex: 2,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          snapshot
                                                              .data!
                                                              .articles![index]
                                                              .title
                                                              .toString(),
                                                          style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              snapshot
                                                                  .data!
                                                                  .articles![
                                                                      index]
                                                                  .source!
                                                                  .name
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                            Text(format.format(
                                                                dateTime)),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
            )
          ],
        ));
  }
}
