class DogModel {
  DogModel({
    required this.message,
  });

  String message;

  factory DogModel.fromJson(Map<String, dynamic> json) => DogModel(
        message: json["message"],
      );
}
