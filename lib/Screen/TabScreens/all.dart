import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shopy/Screen/detail_screen.dart';

import 'package:shopy/shopy_models.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref().child("shopping");
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height / 100 * 60,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.7,
                children: <Widget>[
                  _buildCard("Coat", "30", "assets/images/img_1.jpg", true, true, context),
                  _buildCard("Coat", "30", "assets/images/kid_1.jpeg", true, true, context),
                  _buildCard("Coat", "30", "assets/images/img_1.webp", true, true, context),
                  _buildCard("Coat", "30", "assets/images/IMG_2.jpg", true, true, context),
                   _buildCard("Coat", "30", "assets/images/IMG_2.jpg", true, true, context),
                  _buildCard("Coat", "30", "assets/images/img_1.webp", true, true, context)
                
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFav, context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0, bottom: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailScreen(
                  assetPath: imgPath, clothprice: price, clothesname: name)));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5.0,
                )
              ],
              color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFav
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.deepOrange,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: Colors.deepOrange,
                          )
                  ],
                ),
              ),
              FadeInImage(
                width: 75,
                height: 75,
                placeholder: AssetImage(imgPath),
                image: AssetImage(imgPath),
              ),
              const SizedBox(
                height: 7.0,
              ),
              Text(
                price,
                style: const TextStyle(
                    color: Colors.deepOrange,
                    fontFamily: 'Roboto',
                    fontSize: 15),
              ),
              Text(
                name,
                style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.deepOrange,
                  height: 1.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!added) ...[
                      const Icon(
                        Icons.shopping_basket,
                        color: Colors.deepOrange,
                        size: 14,
                      ),
                      const Text(
                        "Add To Cart",
                        style: TextStyle(fontSize: 12.0),
                      )
                    ],
                    if (added) ...[
                      const Icon(Icons.remove_circle_outline,
                          color: Colors.deepOrange, size: 12.0),
                      const Text('3',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0)),
                      const Icon(Icons.add_circle_outline,
                          color: Colors.deepOrange, size: 12.0),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
