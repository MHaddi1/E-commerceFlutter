import 'package:flutter/material.dart';

class AddTOCart extends StatefulWidget {
  const AddTOCart({super.key});

  @override
  State<AddTOCart> createState() => _AddTOCartState();
}

class _AddTOCartState extends State<AddTOCart> {
  bool added = false;
  int counter = 0;
  void cartCheck() {
    setState(() {
      added = !added;
    });
  }

  void _increment() {
    setState(() {
      counter++;
    });
  }

  void _decrement() {
    setState(() {
      counter = counter > 0 ? counter - 1 : 0;
    });
    if(counter==0){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            if (!added) ...[
              GestureDetector(
                onTap: cartCheck,
                child: const Icon(
                  Icons.shopping_basket,
                  color: Colors.deepOrange,
                  size: 14,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Text(
                "Add To Cart",
                style: TextStyle(fontSize: 12.0),
              )
            ],
            if (added) ...[
              GestureDetector(
                onTap: _decrement,
                child: const Icon(Icons.remove_circle_outline,
                    color: Colors.deepOrange, size: 12.0),
              ),
              const SizedBox(
                width: 5.0,
              ),
              Text('$counter',
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0)),
              const SizedBox(
                width: 5.0,
              ),
              GestureDetector(
                onTap: _increment,
                child: const Icon(Icons.add_circle_outline,
                    color: Colors.deepOrange, size: 12.0),
              ),
            ]
          ],
        )
      ],
    );
  }
}
