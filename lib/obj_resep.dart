import 'dart:convert';

// List<Resep> ResepFromJson(String str) =>
//     List<Resep>.from(json.decode(str).map((x) => Resep.fromMap(x)));

class Resep {
  final String title;
  final String image;
  final String category;
  final String description;
  final String color;

  Resep(
      {required this.title,
      required this.color,
      required this.image,
      required this.category,
      required this.description});

  // factory Resep.fromMap(Map<String, dynamic> json) => Resep(
  //     title: json["title"],
  //     image: json["image"],
  //     category: json["category"],
  //     description: json["description"],
  // );
}






RecipesList recipesAll = RecipesList(recipe: [
  Resep(
    title: "Es Buah",
    color: "Silver",
    category: "Minuman",
    image: "assets/images/Contoh Procedure Text 'Cara Membuat Es Buah' Dalam Bahasa Inggris Beserta Artinya.png",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  ),
  Resep(
    title: "Ayam Mentega",
    color: "Silver",
    category: "Ayam",
    image: "assets/images/img-butter-chicken.webp",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  ),
  Resep(
    title: "Tumis Kangkung",
    color: "Putih",
    category: "Sayuran",
    image: "assets/images/images_sayuran_Tumis-kangkung-udang1.jpg",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  ),
  Resep(
    title: "Chocolate Cake",
    color: "Jingga",
    category: "Kue",
    image: "assets/images/img-chocolate-fudge-cake.webp",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  ),
  Resep(
    title: "Sate Taichan",
    color: "Hitam",
    category: "Camilan",
    image: "assets/images/Sate Taichan Fenomenal yang Praktis dan Lezat - Resep _ ResepKoki.jpg",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  ),
  Resep(
    title: "Pempek Palembang",
    color: "Hitam",
    category: "Seafood",
    image: "assets/images/Pempek Ikan Palembang Saus Cuko (Indonesian Fish Cakes).jpg",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  ),
]);

class RecipesList {
  List<Resep> recipe;

  RecipesList({required this.recipe});
}
