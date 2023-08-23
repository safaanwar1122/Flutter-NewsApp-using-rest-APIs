import 'package:flutter/material.dart';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter',style: TextStyle(
              fontFamily: 'Pacifico',fontSize: 30,color: Colors.red,
            ),),
            Text('NewsApp  ',style: TextStyle(
              fontFamily: 'Pacifico',fontSize: 30,color: Colors.black,
            ),),
          ],
        ),
      ),
    );
  }
}
