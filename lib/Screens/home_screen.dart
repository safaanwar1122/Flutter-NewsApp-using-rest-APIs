import 'package:flutter/material.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              itemBuilder: (context)=>[
                const PopupMenuItem(
                    value: 1,
                    child: Text('BBC news')),
                const PopupMenuItem(
                    value: 2,
                    child: Text('Al-Jazeera-english news')),
                const PopupMenuItem(
                    value: 3,
                    child: Text('CNN news')),
                const PopupMenuItem(
                    value: 4,
                    child: Text('Independent news')),
                const PopupMenuItem(
                    value: 5,
                    child: Text('Ary news')),
              ]),

        ],
      ),
    );
  }
}
