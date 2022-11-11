import 'package:dio/dio.dart';
import 'package:dogs/dog_model.dart';
import 'package:dogs/dog_service.dart';
import 'package:dogs/image_dog_button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      backgroundColor: Color.fromARGB(255, 218, 203, 198),
      appBar: AppBar(
        centerTitle: true,
        title: Text('API Dogs Project'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          FutureBuilder(
              initialData: DogModel(message: ''),
              future: service.getDog(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: const CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Erro"),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  DogModel data = snapshot.data as DogModel;
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(child: Image.network(data.message)),
                  );
                } else {
                  return Container(
                    child: Text('Error'),
                  );
                }
              }),
          IconButton(
              onPressed: () {
                setState(() {
                  service.getDog();
                });
              },
              icon: Icon(
                Icons.change_circle,
                size: 50,
                color: Color.fromARGB(255, 54, 38, 32),
              ))
        ],
      ),
    );
  }
}
