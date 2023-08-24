import 'package:flutter/material.dart';

class NewsDetailViewModel extends StatefulWidget {
  const NewsDetailViewModel({Key? key}) : super(key: key);

  @override
  State<NewsDetailViewModel> createState() => _NewsDetailViewModelState();
}

class _NewsDetailViewModelState extends State<NewsDetailViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: Column(

      ),
    );
  }
}
