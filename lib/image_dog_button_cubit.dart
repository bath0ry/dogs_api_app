import 'package:dio/dio.dart';
import 'package:dogs/dog_model.dart';
import 'package:dogs/dog_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogButtonCubit extends Cubit<Image> {
  DogButtonCubit() : super(Image.network(''));
  void switchDogImage() =>
      emit(state == Image.network('https://dog.ceo/api/breeds/image/random')
          ? Image.network('https://dog.ceo/api/breeds/image/random')
          : Image.network('https://dog.ceo/api/breeds/image/random'));
}
