class UserModel {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String userImage;
  final String userDeviceToken;
  final String country;
  final String address;
  final String street;
  final String city;
  final bool isAdmin;
  final bool isActive;
  final dynamic createdOn;

  UserModel(
      {required this.uid,
      required this.name,
      required this.city,
      required this.email,
      required this.phone,
      required this.userImage,
      required this.userDeviceToken,
      required this.country,
      required this.address,
      required this.street,
      required this.isAdmin,
      required this.isActive,
      required this.createdOn});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'userImage': userImage,
      'userDeviceToken': userDeviceToken,
      'country': country,
      'address': address,
      'street': street,
      'city': city,
      'isAdmin': isAdmin,
      'isActive': isActive,
      'createdOn': createdOn,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
        uid: json['uid'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        userImage: json['userImage'],
        userDeviceToken: json['userDeviceToken'],
        country: json['country'],
        address: json['address'],
        street: json['street'],
        city: json['city'],
        isAdmin: json['isAdmin'],
        isActive: json['isActive'],
        createdOn: json['createdOn']);
  }
}
