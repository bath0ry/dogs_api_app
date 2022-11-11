import 'package:dio/dio.dart';
import 'package:dogs/dog_model.dart';
import 'package:dogs/dog_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final DogService service;
  @override
  void initState() {
    service = DogService(Dio());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
          initialData: DogModel(message: ''),
          future: service.getDog(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Erro"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              DogModel data = snapshot.data as DogModel;
              return Center(child: Image.network(data.message));
            } else {
              return Container();
            }
          }),
    );
  }
}
