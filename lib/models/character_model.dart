class CharacterModel {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? title;
  String? family;
  String? image;
  String? imageUrl;

  CharacterModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.fullName,
        this.title,
        this.family,
        this.image,
        this.imageUrl
      });

 factory CharacterModel.fromJson(Map<String, dynamic> json) {
   final referenceImage = json['image'];
   final imageUrl = referenceImage != null
       ? 'https://thronesapi.com/assets/images/$referenceImage'
       : null;
   return CharacterModel(
    id : json['id'],
    firstName : json['firstName'],
    lastName : json['lastName'],
    fullName : json['fullName'],
    title : json['title'],
    family : json['family'],
    image : json['image'],
    imageUrl : imageUrl,
    );
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'firstName' : firstName,
    'lastName' : lastName,
    'fullName' : fullName,
    'title' : title,
    'family' : family,
    'image' : image,
    'imageUrl' : imageUrl
  };
 factory CharacterModel.fromMap(Map<String, dynamic> map ) {
   return CharacterModel(
     id : map['id'],
     firstName : map['firstName'],
     lastName : map['lastName'],
     fullName : map['fullName'],
     title : map['title'],
     family : map['family'],
     imageUrl : map['imageUrl'],
   );
 }
}