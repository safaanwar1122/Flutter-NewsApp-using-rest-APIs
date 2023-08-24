import 'package:flutter/material.dart';
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               ElevatedButton(onPressed: (){

               }, child: const Text('Sports', style: TextStyle(
                 fontFamily: 'Pacifico',fontSize: 18,fontWeight: FontWeight.bold,
                 color: Colors.black,
               ),),
               ),
               ElevatedButton(onPressed: (){

               }, child: const Text('Health', style: TextStyle(
                 fontFamily: 'Pacifico',fontSize: 18,fontWeight: FontWeight.bold,
                 color: Colors.black,
               ),),
               ),
               ElevatedButton(onPressed: (){

               }, child: const Text('Entertainment', style: TextStyle(
                 fontFamily: 'Pacifico',fontSize: 18,fontWeight: FontWeight.bold,
                 color: Colors.black,
               ),),

               ),
               ElevatedButton(onPressed: (){

               }, child: Text('Technology', style: TextStyle(
                 fontFamily: 'Pacifico',fontSize: 18,fontWeight: FontWeight.bold,
                 color: Colors.black,
               ),),

               ),
               ElevatedButton(onPressed: (){

               }, child: const Text('General', style: TextStyle(
                 fontFamily: 'Pacifico',fontSize: 18,fontWeight: FontWeight.bold,
                 color: Colors.black,
               ),),

               ),
               ElevatedButton(onPressed: (){

               }, child: const Text('Business', style: TextStyle(
                 fontFamily: 'Pacifico',fontSize: 18,fontWeight: FontWeight.bold,
                 color: Colors.black,
               ),),

               ),
             ],
           ),

          ],
        ),
      ),
    );
  }
}
