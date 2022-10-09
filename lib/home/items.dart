class Items {
  final String title;
  final String path;
  final String warna;

  Items({required this.title, required this.path, required this.warna,});
}

RecipesList Recipes= RecipesList(recipe: [
  Items(
    title: "Es Buah",
    warna: "Silver",
    path: "assets/images/Contoh Procedure Text 'Cara Membuat Es Buah' Dalam Bahasa Inggris Beserta Artinya.png"
  ),
  Items(
      title: "Ayam Mentega",
      warna: "Silver",
      path: "assets/images/img-butter-chicken.webp"
  ),
  Items(
      title: "Chicken Fajitas",
      warna: "Putih",
      path: "assets/images/img-chicken-fajitas.webp"
  ),
  Items(
      title: "Chocolate Cake",
      warna: "Jingga",
      path: "assets/images/img-chocolate-fudge-cake.webp"
  ),
  Items(
      title: "Lasagna",
      warna: "Hitam",
      path: "assets/images/img-classic-lasange.webp"
  ),
  Items(
      title: "Pempek Palembang",
      warna: "Hitam",
      path: "assets/images/Pempek Ikan Palembang Saus Cuko (Indonesian Fish Cakes).jpg"
  ),
]);

class RecipesList {
  List<Items> recipe;

  RecipesList({required this.recipe});
}