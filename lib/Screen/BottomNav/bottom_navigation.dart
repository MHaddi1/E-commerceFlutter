import 'package:flutter/material.dart';


class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  @override
  Widget build(BuildContext context) {
      return  BottomAppBar(
      shape: const CircularNotchedRectangle(
      ),
      notchMargin: 6.0,
      color: Colors.transparent,
      elevation: 9.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0),topRight: Radius.circular(25)),
          color: Colors.white
        ),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width/2-40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [IconButton(onPressed: (){}, icon: const Icon(Icons.home),
                ),
                IconButton(onPressed: (){}, icon: const Icon(Icons.person),)],
              ),
            ),
              Container(
              height: 50,
              width: MediaQuery.of(context).size.width/2-40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [IconButton(onPressed: (){}, icon: const Icon(Icons.search),
                ),
                IconButton(onPressed: (){}, icon: const Icon(Icons.shop),)],
              ),
            )
          ],
        ),
        
      ),
      
    );
   
  }
}