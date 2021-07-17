
import 'dart:convert';

class Consumer {
  final int id;
  final String firstName;
  final String lastName;
  final int gender;
  final String birthDate;
  final String country;
  final int phoneNumber;
  final String passportNumber;
  final String cardNumber;
  final String email;

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


}