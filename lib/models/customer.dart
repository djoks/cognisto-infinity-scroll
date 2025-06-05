class Customer {
  final String name;
  final String email;
  final String image;

  Customer({required this.name, required this.email, required this.image});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      name: "${json['firstName']} ${json['maidenName']} ${json['lastName']}",
      email: json['email'],
      image: json['image'],
    );
  }
}
