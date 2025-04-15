
class Pay{
  final CardModel card;
  final Address address;

  const Pay(this.card, {
    required this.address,
  });
}

class CardModel{
  final String name;
  final String type;
  final String number;
  final String dateTime;
  final int cvv;

  const CardModel({
    required this.name,
    required this.type,
    required this.number,
    required this.dateTime,
    required this.cvv,
  });
}

class Address{
  final String country;
  final String city;
  final int postCode;
  final String street;

  const Address({
    required this.country,
    required this.city,
    required this.postCode,
    required this.street,
  });
}