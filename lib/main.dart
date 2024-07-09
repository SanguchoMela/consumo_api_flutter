import 'package:consumo_api/providers/dog_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DogProvider()),
        ],
        child: MaterialApp(
            title: "Dog Images",
            theme: ThemeData(primarySwatch: Colors.amber),
            home: DogScreen()));
  }
}

class DogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dogProvider = Provider.of<DogProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Images'),
      ),
      body: dogProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: 1,
              ),
              itemCount: dogProvider.dogList.length,
              itemBuilder: (context, index) {
                return Center(
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.network(
                      dogProvider.dogList[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dogProvider.fetchDogImage();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
