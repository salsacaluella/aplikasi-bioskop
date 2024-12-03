import 'package:flutter/material.dart';

class Bioskop extends StatefulWidget {
  @override
  _BioskopState createState() => _BioskopState();
}

class _BioskopState extends State<Bioskop> {
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
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Lokasi
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
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
          ),

          // Keterangan di bawah kolom pencarian
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(Icons.favorite,
                    color: Colors.red, size: 30), // Ikon penghias
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Tandai bioskop favoritmu",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Bioskop favoritmu akan berada paling atas daftar",
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Daftar bioskop
          Expanded(
            child: ListView(
              children: [
                _buildBioskopItem('Aeon Mall JGC CGV'),
                _buildBioskopItem('Aeon Mall Tanjung Barat XXI'),
                _buildBioskopItem('AGORA MALL IMAX'),
                _buildBioskopItem('Aeon Mall JGC CGV'),
                _buildBioskopItem('Aeon Mall Tanjung Barat XXI'),
                _buildBioskopItem('AGORA MALL IMAX'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBioskopItem(String bioskopName) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!, width: 1.0),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.stars_rounded, color: Colors.black),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              bioskopName,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        ],
      ),
    );
  }
}
 