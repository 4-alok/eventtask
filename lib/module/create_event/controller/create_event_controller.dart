import '../../../data/repository/repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../di.dart';

class CreateEventController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final imagePath = ValueNotifier<String?>(null);
  final startingDate = ValueNotifier<DateTime?>(null);
  final endDate = ValueNotifier<DateTime?>(null);

  Future<void> pickImage() async => await ImagePicker()
      .pickImage(source: ImageSource.gallery)
      .then((value) => (value != null) ? imagePath.value = value.path : null);

  Future<void> pickStartingDate(BuildContext context) async =>
      await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        initialDate: DateTime.now(),
        lastDate: DateTime(2100),
      ).then((value) => (value != null) ? startingDate.value = value : null);

  Future<void> pickEndDate(BuildContext context) async => await showDatePicker(
        context: context,
        firstDate: startingDate.value ?? DateTime(2000),
        initialDate: DateTime.now(),
        lastDate: DateTime(2100),
      ).then((value) => (value != null) ? endDate.value = value : null);

  Map<String, dynamic> get getData => {
        "title": titleController.text,
        "description": descriptionController.text,
        "imagePath": imagePath.value,
        "startingDate": startingDate.value?.millisecondsSinceEpoch,
        "endDate": endDate.value?.millisecondsSinceEpoch,
      };

  Future uploadImage() async {
    await getIt<RepositoryImpl>().uploadImage({
      "image": imagePath.value,
    });
  }

  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    startingDate.dispose();
    endDate.dispose();
    imagePath.dispose();
  }
}
