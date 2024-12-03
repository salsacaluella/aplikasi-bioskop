import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  List<String> categories = ["Semua Film", "XXI", "CGV", "Cinepolis"];
  int selectedCategoryIndex = 0;

  List<String> promoImages = [
    'assets/promosi2.png',
    'assets/promosi2.png',
    'assets/promosi2.png',
    'assets/promosi2.png',
  ];

  // Category selection function
  void selectCategory(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Cari bioskop...',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Jakarta label and TIX VIP banner
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, color: Colors.black),
                const SizedBox(width: 8),
                Text(
                  "JAKARTA",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.keyboard_arrow_down,
                      color: Colors.black),
                  onPressed: () {
                    // Fungsi dropdown lokasi
                  },
                ),
              ],
            ),
            // Horizontal PageView for banners
            Container(
              height: 150, // Banner height
              child: PageView.builder(
                itemCount: promoImages.length,
                controller: PageController(viewportFraction: 0.9),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          promoImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Static images for "Sedang Tayang"
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Sedang Tayang",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => selectCategory(index),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == index
                            ? const Color(0xFF041C3B)
                            : const Color.fromARGB(255, 95, 94, 94),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(padding: const EdgeInsets.all(16)),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset('assets/posterfilm3.png', fit: BoxFit.cover),
                  SizedBox(width: 10),
                  Image.asset('assets/posterfilm2.png', fit: BoxFit.cover),
                  SizedBox(width: 10),
                  Image.asset('assets/posterfilm4.png', fit: BoxFit.cover),
                  SizedBox(width: 10),
                  Image.asset('assets/posterfilm6.png', fit: BoxFit.cover),
                ],
              ),
            ),
            // Section "Spotlight"
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Spotlight",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Berita terhangat untuk Anda",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              height: 175,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCard('assets/promosi.png',
                      "Sedang live!!! Behind The Scene Bulba XI R2"),
                  _buildCard(
                      'assets/promosi.png', "Nantikan segera Film dari XI R2"),
                  _buildCard('assets/promosi.png', "Siaran terbaru (ON GOING)"),
                ],
              ),
            ),
            // Section "TIX Now"
            TixNowScreen(),
          ],
        ),
      ),
    );
  }

  // Helper function to build the cards in "Spotlight" section
  Widget _buildCard(String image, String title) {
    return Card(
      child: Container(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Tix Now Screen Section
class TixNowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'TIX Now',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Update berita terbaru seputar TIX id',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildTixNowItem(
              'Film keren hebat wow asik harus nonton ',
              'Friday, 29 November 2024',
              'Dia tidak tahu ukl ini susah..',
              'https://asset.tix.id/wp-content/uploads/2024/11/90fe5f4b-7fbf-4b28-bdcb-828310598a0e.webp',
              'https://www.tix.id/teror-death-whisperer-kembali-lagi/',
            ),
            _buildTixNowItem(
              'Saksikan lagi film terbaru dari sutradara Salsa',
              'Thursday, 28 November 2024',
              'TKeren asik wowowowowowowoww ukl seru',
              'https://asset.tix.id/wp-content/uploads/2024/11/c23ecf8f-d5f2-4eed-a06f-757ccc81c928.webp',
              'https://www.tix.id/saksikan-kembalinya-teror-guna-guna-istri-muda/',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTixNowItem(
      String title, String date, String content, String imageUrl, String link) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: 120,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(date, style: TextStyle(fontSize: 12, color: Colors.grey)),
                Text(content, style: TextStyle(fontSize: 14)),
                TextButton(
                  onPressed: () {
                    // Aksi saat mengklik link
                    print('Open link: $link');
                  },
                  child: Text('Baca Selengkapnya'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
