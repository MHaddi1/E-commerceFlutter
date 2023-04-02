import 'package:flutter/material.dart';
import 'package:shopy/Screen/detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopy/widgets/add_to_cart.dart';
import 'package:shopy/widgets/favirate.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            Container(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("shopping")
                      .snapshots(),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Container(
                      padding: const EdgeInsets.only(right: 15),
                      width: MediaQuery.of(context).size.width - 30.0,
                      height: MediaQuery.of(context).size.height / 100 * 60,
                      child: GridView.count(
                          crossAxisCount: 2,
                          primary: false,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.7,
                          children: List.generate(snapshot.data!.docs.length,
                              (index) {
                            return GridTile(
                              child: _buildCard(
                                  snapshot.data!.docs[index] ,context),
                            );
                          })),
                    );
                  })),
            ),
            const SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard(DocumentSnapshot snapshot, BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0, bottom: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailScreen(
                  assetPath: snapshot['image'],
                  clothprice: snapshot['price'],
                  clothesname: snapshot['name'],
                  description: snapshot['description'],)));
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
                  children: const [
                  Favirate()
                  ],
                ),
              ),
              FadeInImage(
                width: 75,
                height: 75,
                placeholder: NetworkImage(snapshot['image']),
                image: NetworkImage(snapshot['image']),
              ),
              const SizedBox(
                height: 7.0,
              ),
              Text(
                snapshot['price'].toString(),
                style: const TextStyle(
                    color: Colors.deepOrange,
                    fontFamily: 'Roboto',
                    fontSize: 15),
              ),
              Text(
                snapshot['name'],
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
                  children: const [
                   AddTOCart()
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
