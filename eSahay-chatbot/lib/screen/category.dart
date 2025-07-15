import 'package:flutter/material.dart';
class Category extends StatelessWidget {
  final List<CategoryItem> categories = [
    CategoryItem('Music', Icons.music_note, 'Freebird'),
    CategoryItem('Videos', Icons.play_arrow, 'Thousand of Videos'),
    CategoryItem('Games', Icons.games, 'Unlimited Games'),
    CategoryItem('Books', Icons.book, 'Unlimited Books'),
    CategoryItem('Pictures', Icons.photo, 'Download Free Pics'),
    CategoryItem('Shopping', Icons.shopping_cart, 'Shop by Brands'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Default is 56.0
        child: Container(
          decoration: const BoxDecoration(
          gradient: LinearGradient(
          colors: [Color.fromARGB(255, 236, 143, 37), Color(0xFFE26843)],
          stops: [0,1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
          ),
        child: AppBar( 
        title: Text('Categories',
        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      ),
  ),
      drawer: Drawer(), // Add a drawer if necessary
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}

class CategoryItem {
  final String title;
  final IconData icon;
  final String subtitle;

  CategoryItem(this.title, this.icon, this.subtitle);
}

class CategoryCard extends StatelessWidget {
  final CategoryItem category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: () {
          // Handle card tap, you can use Get.toNamed() for navigation
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category.icon,
                size: 48.0,
                color: Colors.blue.shade300,
              ),
              SizedBox(height: 16.0),
              Text(
                category.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                category.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}