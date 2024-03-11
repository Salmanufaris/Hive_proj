import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_provider.dart';
import 'package:provider/provider.dart';

class Favrscreen extends StatefulWidget {
  const Favrscreen({super.key});

  @override
  State<Favrscreen> createState() => _FavrscreenState();
}

class _FavrscreenState extends State<Favrscreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<Homeprovider>(context, listen: false).getAllFavourite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
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
      body: Consumer<Homeprovider>(
        builder: (context, value, child) => ListView.builder(
            itemCount: value.favoriteItems.length,
            itemBuilder: (context, index) {
              final item = value.favoriteItems[index];
              return Card(
                color: Colors.amber,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(item.image),
                  ),
                  title: Text(item.firstname),
                  subtitle: Text(item.lastname),
                ),
              );
            }),
      ),
    );
  }
}
