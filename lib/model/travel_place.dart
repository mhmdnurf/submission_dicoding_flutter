class TravelPlace {
  String name;
  double rating;
  num days;
  num distance;
  String description;
  String imageAsset;
  String location;
  double price;

  TravelPlace(
      {required this.name,
      required this.rating,
      required this.days,
      required this.distance,
      required this.description,
      required this.imageAsset,
      required this.location,
      required this.price});
}

var travelPlaceList = [
  TravelPlace(
      name: 'Akropolis Athena',
      rating: 5.0,
      days: 12,
      distance: 120,
      description:
          'The Acropolis of Athens is an ancient citadel perched atop a rocky hill overlooking the city of Athens, Greece. More than just a collection of ruins, the Acropolis stands as a symbol of the glory of ancient Greek civilization, a testament to the art, architecture, and philosophy that flourished during that era.',
      imageAsset: 'assets/images/athena.jpg',
      location: 'Athena, Greece',
      price: 890.00),
  TravelPlace(
      name: 'Cappadocia',
      rating: 5.0,
      days: 10,
      distance: 150,
      description:
          'Cappadocia is a historical region in Central Anatolia, largely in the Nevşehir Province of Turkey. It is known for its unique geological features, particularly the "fairy chimneys" – tall, cone-shaped rock formations clustered in valleys and canyons. These were formed by ancient volcanic eruptions, followed by millennia of erosion.',
      imageAsset: 'assets/images/cappadocia.jpg',
      location: 'Anatolia, Turkey',
      price: 1200.00),
  TravelPlace(
      name: 'Sensoji Temple',
      rating: 5.0,
      days: 14,
      distance: 200,
      description:
          "It is Tokyo's oldest temple, and one of its most significant. The temple is dedicated to Kannon Bosatsu, the bodhisattva of compassion. Sensoji is a popular tourist destination and a major landmark of the city.",
      imageAsset: 'assets/images/sensoji.jpg',
      location: 'Tokyo, Japan',
      price: 790.00)
];
