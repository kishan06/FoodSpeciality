class GridviewuserContent {
  String recipeimage;
  String title;
  String name;

  GridviewuserContent(
      {required this.recipeimage, required this.title, required this.name});
}

List<GridviewuserContent> contents = [
  GridviewuserContent(
      recipeimage: 'assets/pickle.png',
      title: 'Slappappoffer Recipe',
      name: "@Priyujoshi"),
  GridviewuserContent(
      recipeimage: 'assets/babotie.png', title: 'Babotie', name: "@Priyujoshi"),
  GridviewuserContent(
      recipeimage: 'assets/savour.png',
      title: 'Savour Muffins',
      name: "@Priyujoshi"),
  GridviewuserContent(
      recipeimage: 'assets/bunny.png',
      title: 'Bunny Chow',
      name: "@Priyujoshi"),
  GridviewuserContent(
      recipeimage: 'assets/chow.png',
      title: 'Savour Muffins',
      name: "@Priyujoshi"),
  GridviewuserContent(
      recipeimage: 'assets/pickle.png',
      title: 'Slappappoffer Recipe',
      name: "@Priyujoshi"),
];
