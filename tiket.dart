import 'package:flutter/material.dart';

class Tiket extends StatefulWidget {
  @override
  State<Tiket> createState() => _TiketState();
}

class _TiketState extends State<Tiket> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<String> movieImages = [
    'assets/posterfilm3.png',
    'assets/posterfilm4.png',
    'assets/posterfilm2.png',
    'assets/posterfilm.jpg',
    'assets/posterfilm5.png',
    'assets/posterfilm6.png',
  ];
  List<String> moviename = [
    "Bila Esok Ibu Tiada",
    "Santet Segoro Pitu",
    "Gladiator II",
    "Red One",
    "Labubu The Movie",
    "Tisha Ivanna"
  ];
  List<String> genre = [
    "Drama, Keluarga",
    "Horror",
    "Action",
    "Action",
    "Adventure, Action",
    "Horror, Thriller"
  ];
  List<String> rating = ["9.2", "9.0", "8.8", "7.5", "8.5", "9.5"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Film Bioskop", style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF041C3B),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(text: "Sedang Tayang"),
            Tab(text: "Akan Datang"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMovieGrid(screenWidth),
          _buildMovieGrid(screenWidth),
        ],
      ),
    );
  }

  Widget _buildMovieGrid(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenWidth > 600 ? 3 : 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio:
              0.6, 
        ),
        itemCount: movieImages.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: AspectRatio(
                        aspectRatio: 3 / 4, 
                        child: Image.asset(
                          movieImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        moviename[index],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        genre[index],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "⭐ ${rating[index]}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.favorite_border),
                    color: Colors.red,
                    iconSize: 20,
                    onPressed: () {
                      
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
