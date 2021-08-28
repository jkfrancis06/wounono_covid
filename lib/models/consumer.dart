
import 'dart:convert';

import 'package:country_picker/country_picker.dart';

class Consumer {
   int id;
   String firstName;
   String lastName;
   int  gender;
   String birthDate;
   String country;
   String phoneNumber;
   String passportNumber;
   String cardNumber;
   String email;

  Consumer({this.id, this.firstName, this.lastName, this.gender, this.birthDate, this.country, this.phoneNumber, this.passportNumber, this.cardNumber, this.email});

  factory Consumer.fromJson(Map<String, dynamic> json) {
    return Consumer(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        gender: json['gender'],
        birthDate: json['birthDate'],
        country: json['country'],
        phoneNumber: json['phoneNumber'],
        passportNumber: json['passportNumber'],
        cardNumber: json['cardNumber'],
        email: json['email']
    );
  }


  static Map<String, dynamic> toMap(Consumer consumer) => {
    'id': consumer.id,
    'firstName': consumer.firstName,
    'lastName': consumer.lastName,
    'gender': consumer.gender,
    'birthDate': consumer.birthDate,
    'country': consumer.country,
    'phoneNumber': consumer.phoneNumber,
    'passportNumber': consumer.passportNumber,
    'cardNumber': consumer.cardNumber,
    'email': consumer.email,
  };

  Map<String, dynamic> toJson() => {
     'id': id,
     'firstName': firstName,
     'lastName': lastName,
     'gender': gender,
     'birthDate': birthDate,
     'country': country,
     'phoneNumber': phoneNumber,
     'passportNumber': passportNumber,
     'cardNumber': cardNumber,
     'email': email,
   };


}