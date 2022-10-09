class Items {
  final String title;
  final String path;
  final String color;
  final String category;

  Items({required this.title, required this.path, required this.color, required this.category});
}

RecipesList recipesAll= RecipesList(recipe: [
  Items(
    title: "Es Buah",
    color: "Silver",
    category: "Minuman",
    path: "assets/images/Contoh Procedure Text 'Cara Membuat Es Buah' Dalam Bahasa Inggris Beserta Artinya.png"
  ),
  Items(
      title: "Ayam Mentega",
      color: "Silver",
      category: "Ayam",
      path: "assets/images/img-butter-chicken.webp"
  ),
  Items(
      title: "Tumis Kangkung",
      color: "Putih",
      category: "Sayuran",
      path: "assets/images/images_sayuran_Tumis-kangkung-udang1.jpg"
  ),
  Items(
      title: "Chocolate Cake",
      color: "Jingga",
      category: "Kue",
      path: "assets/images/img-chocolate-fudge-cake.webp"
  ),
  Items(
      title: "Sate Taichan",
      color: "Hitam",
      category: "Camilan",
      path: "assets/images/Sate Taichan Fenomenal yang Praktis dan Lezat - Resep _ ResepKoki.jpg"
  ),
  Items(
      title: "Pempek Palembang",
      color: "Hitam",
      category: "Seafood",
      path: "assets/images/Pempek Ikan Palembang Saus Cuko (Indonesian Fish Cakes).jpg"
  ),
]);

class RecipesList {
  List<Items> recipe;

  RecipesList({required this.recipe});
}