// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//Information Data
List<String> foodNames = [];
List<String> foodPrices = [];
List<String> debtorNames = [];
List<PricePerPerson> pricePerPerson = []; // -- > status
Map<String, bool> foodSelections = {};

//Status Theme
Color statusAppBarColor = const Color.fromRGBO(45, 50, 80, 1);
Color statusMainBackGroundColor = const Color.fromRGBO(45, 50, 80, 1);
Color statusCardBackGroundColor = const Color.fromRGBO(66, 71, 105, 1);
Color statusFontColor = const Color.fromRGBO(255, 255, 255, 1);

//Host Theme
Color hostAppBarColor = const Color.fromRGBO(45, 50, 80, 1);
Color hostMainBackGroundColor = const Color.fromRGBO(45, 50, 80, 1);
Color hostCardBackGroundColor = const Color.fromRGBO(66, 71, 105, 1);
Color hostButtonColor = const Color.fromRGBO(103, 100, 157, 1);
Color hostPhotoButtonColor = const Color.fromRGBO(249, 177, 122, 1);
Color hostFontColor = const Color.fromRGBO(255, 255, 255, 1);

//Debtor Theme
Color debtorAppBarColor = const Color.fromRGBO(45, 50, 80, 1);
Color debtorMainBackGroundColor = const Color.fromRGBO(45, 50, 80, 1);
Color debtorCardBackGroundColor = const Color.fromRGBO(66, 71, 105, 1);
Color debtorFontColor = const Color.fromRGBO(255, 255, 255, 1);
Future<String?> pickImage() async {
  final imagePicker = ImagePicker();
  final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    // Do something with the picked image (e.g., display it in an Image widget).
    File imageFile = File(pickedImage.path);
    // Handle the image file as needed.

    // Return the image path.
    return pickedImage.path;
  } else {
    // User canceled the image picking.
    return null;
  }
}

// for stacking name and price
class PricePerPerson {
  final String name;
  final double price;

  PricePerPerson(this.name, this.price);
}
