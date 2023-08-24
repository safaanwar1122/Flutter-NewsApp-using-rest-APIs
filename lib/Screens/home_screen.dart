import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                  future:topNewsHeadlinesClass.getTopNewsHeadlines(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(

                          itemCount: snapshot!.data!.articles?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ( context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    color: Colors.blue,
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),

                                    ),
                                    margin: EdgeInsets.only(right: 20),
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      width: 300,

                                      child: Column(
                                        children:
                                        [
                                          Text('hi'),
                                          ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: SizedBox(height: 120,
                                          width: double.infinity,
                                            child: Stack(
                                              children: [
                                                Positioned.fill(child: Image(
                                                  image: NetworkImage(snapshot.data!.articles![index].urlToImage.toString()),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ),

                                        ],

                                      ),
                                    ),
                                  ),
                                ),
                                Text('ji'),
                              ],
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
