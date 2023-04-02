import 'package:flutter/material.dart';

class Favirate extends StatefulWidget {
  const Favirate({Key? key}) : super(key: key);

  @override
  _FavirateState createState() => _FavirateState();
}

class _FavirateState extends State<Favirate> {
  bool _isPressed = false;

  void _togglePressed() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePressed,
      child: Icon(_isPressed ? Icons.favorite : Icons.favorite_border,
        color: _isPressed ? Colors.red : Colors.grey,),
      
    );
  }
}
