class DogBreed {
  final int id;
  final String name;
  final String description;
  final String? imageUrl;

  DogBreed({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl
});
  factory DogBreed.fromJson(Map<String, dynamic> json) {
    final referenceImageUrl = json['reference_image_id'];
    final imageUrl = referenceImageUrl != null
        ? 'https://cdn2.thedogapi.com/images/$referenceImageUrl.jpg'
        : null;

    return DogBreed(
      id: json['id'],
      name: json['name'],
      description: json['temperament'] ?? 'Nessuna descrizione',
      imageUrl: imageUrl,
    );
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'description' : description,
    'imageUrl' : imageUrl,
  };

  factory DogBreed.fromMap(Map<String, dynamic> map) {
    return DogBreed(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      imageUrl: map['imageUrl'],
    );
  }
}