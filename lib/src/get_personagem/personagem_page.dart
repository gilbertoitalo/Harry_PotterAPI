
import 'package:flutter/material.dart';
import 'package:harrypotter_api/src/get_personagem/personagem_controller.dart';
import 'package:harrypotter_api/src/get_personagem/personagem_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = SentenceController(repository: SentenceRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: controller.getSentence(),
        builder: (context, snapshot) {
          if (!snapshot.hasData && !snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.data == null || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Não há dados para mostrar!'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    if (snapshot.data![index].image != null ||
                        snapshot.data![index].image!.isNotEmpty)
                      Image.network(
                        snapshot.data![index].image!,
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            snapshot.data![index].name!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            snapshot.data![index].house!,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {}),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
