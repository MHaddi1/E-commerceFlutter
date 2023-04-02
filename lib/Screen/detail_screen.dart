import 'package:flutter/material.dart';
import 'BottomNav/bottom_navigation.dart';


class DetailScreen extends StatefulWidget {
  String assetPath,clothprice,clothesname,description;
  
 

  DetailScreen({super.key, required this.assetPath, required this.clothprice, required this.clothesname,required this.description});

  @override
  State<DetailScreen> createState() =>_DetailScreenState(assetPath,clothprice,clothesname,description);
}

class _DetailScreenState extends State<DetailScreen> {
  String assetPath, clothprice, clothesname,description;

  _DetailScreenState(this.assetPath, this.clothprice, this.clothesname,this.description);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Pickup',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              const SizedBox(height: 15.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Coat',
              style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))
            ),
          ),
            const SizedBox(height: 15.0),
              FadeInImage(
                width: 200,
                height: 250,
                placeholder: NetworkImage(assetPath),
                image: NetworkImage(assetPath),
              ),
            const SizedBox(height: 20.0),
            Center(
              child: Text(clothprice,
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Text(clothesname,
                  style: const TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Roboto',
                      fontSize: 24.0)),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width - 50.0,
                child:  Container(
                  color: Colors.grey[100],
                  height: 90,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(description,
                      
                      style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            color: Colors.black45)
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: const Color(0xFFF17532)
                ),
                child: const Center(
                  child: Text('Add to cart',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                ),
                  )
                )
              )
            )
          ],
        ),
      ),
            floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        backgroundColor: Colors.deepOrange,
        child: IconButton(onPressed: (){},icon: const Icon(Icons.shopping_cart),),
      ),

      bottomNavigationBar: const BottomNavi(),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
