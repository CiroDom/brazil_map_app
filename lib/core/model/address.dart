class Address {
  final String city;
  final String state;
  final String? neighborhood;
  final String? street;

  Address(
      {required this.city,
      required this.state,
      this.neighborhood,
      this.street});

  factory Address.fromMap(map) {
    return Address(
      city: map['city'],
      state: map['state'],
      neighborhood: map['neighborhood'],
      street: map['street'],
    );
  }

  String get formatedAdress {
    final entities = [street, neighborhood, city, state];

    return entities.where((element) => element != null).join(', ');
  }
}
