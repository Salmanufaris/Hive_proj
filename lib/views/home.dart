import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/home_provider.dart';
import 'package:flutter_application_1/model/hive_model.dart';
import 'package:flutter_application_1/model/model.dart';
import 'package:flutter_application_1/views/favourite.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<Homeprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Favrscreen()),
              );
            },
            child: const Text("Favorites"),
          )
        ],
      ),
      body: FutureBuilder<List<Model>>(
        future: pro.loadnotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Model>? data = snapshot.data;
            if (data != null && data.isNotEmpty) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return Card(
                    child: ListTile(
                      trailing: IconButton(
                        onPressed: () {
                          final employ = EmployeeModel(
                              id: item.id!,
                              email: item.email!,
                              firstname: item.firstname!,
                              lastname: item.lastname!,
                              image: item.image!);
                          pro.addToFavourite(employ, context);
                        },
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.red,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: item.image != null
                            ? NetworkImage(item.image ?? "")
                            : const Icon(Icons.person) as ImageProvider,
                      ),
                      title: Text(item.firstname ?? ""),
                      subtitle: Text(item.lastname ?? ""),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          }
        },
      ),
    );
  }
}
