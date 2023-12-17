import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/utils/formatters/formatter.dart';

class UserModel {
  // Keep those values final which you don't update
  final String id, username, email;
  String firstName, lastName, phoneNumber, profilePicture;

  //Constructor for user model
  UserModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.profilePicture});

  // Helper function to get the full name
  String get fullName => '$firstName $lastName';

  // Helper function to format phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  //static funtion to split full name in to first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  //static funtion to generate a user name from the full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername =
        "$firstName$lastName"; //Combine the first and last name
    String usernameWithPrefix = "cwt_$camelCaseUsername"; //Add cwt prefix
    return usernameWithPrefix;
  }

  //static method to create an empty user model
  static UserModel empty() => UserModel(
      id: '',
      username: '',
      email: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      profilePicture: '');

  //Convert model to JSON structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture
    };
  }
}
