import 'package:flutter/material.dart';

class Favrscreen extends StatefulWidget {
  const Favrscreen({super.key});

  @override
  State<Favrscreen> createState() => _FavrscreenState();
}

class _FavrscreenState extends State<Favrscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
        title: const Text(
          "Favourites",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const Column(),
    );
  }
}
