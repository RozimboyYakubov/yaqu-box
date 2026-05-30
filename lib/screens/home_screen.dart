import 'package:flutter/material.dart';
import '../models/restaurant_model.dart';
import '../utils/colors.dart';
import 'products_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<RestaurantModel> magazinlar = [
    RestaurantModel(
      id: '1',
      name: 'Mashhur Restoran',
      imageUrl: 'assets/images/mashhur.jpg',
      mainProductName: 'Croissant',
      workingHours: '20:00 - 23:00',
      distance: '0.6',
      originalPrice: 69000,
      yaquBoxPrice: 20000,
      rating: 4.8,
      location: 'Tashkent, A. Street',
      type: 'restoran',
    ),
    RestaurantModel(
      id: '2',
      name: 'Fresh Juice Bar',
      imageUrl: 'assets/images/juice.jpg',
      mainProductName: 'Natural Soklar',
      workingHours: '08:00 - 22:00',
      distance: '1.2',
      originalPrice: 50000,
      yaquBoxPrice: 15000,
      rating: 4.5,
      location: 'Tashkent, B. Street',
      type: 'soki',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        title: const Text('YAQU BOX', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () => Navigator.pushNamed(context, '/cart')),
        ],
      ),
      drawer: _buildDrawer(context),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: magazinlar.length,
        itemBuilder: (context, index) => _buildRestaurantCard(context, magazinlar[index]),
      ),
    );
  }

  Widget _buildRestaurantCard(BuildContext context, RestaurantModel magazin) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen(restaurant: magazin))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4))]),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [AppColors.primaryBlue.withOpacity(0.8), AppColors.primaryBlueDark.withOpacity(0.9)]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(magazin.name, style: const TextStyle(fontSize: 14, color: Colors.white70, fontWeight: FontWeight.w500)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: AppColors.accentRed, borderRadius: BorderRadius.circular(20)),
                        child: Text('${magazin.rating} ⭐', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.95), borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Container(width: 100, height: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), gradient: LinearGradient(colors: [Colors.orange[200]!, Colors.orange[100]!])), child: Icon(Icons.image, size: 50, color: Colors.grey[500])),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(magazin.mainProductName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                              const SizedBox(height: 6),
                              Row(children: [Icon(Icons.access_time, size: 14, color: Colors.grey[600]), const SizedBox(width: 4), Text(magazin.workingHours, style: TextStyle(fontSize: 12, color: Colors.grey[600]))]),
                              const SizedBox(height: 6),
                              Row(children: [Icon(Icons.location_on, size: 14, color: Colors.grey[600]), const SizedBox(width: 4), Text('${magazin.distance} km', style: TextStyle(fontSize: 12, color: Colors.grey[600]))]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('${magazin.originalPrice} so\'m', style: TextStyle(fontSize: 11, color: Colors.grey[600], decoration: TextDecoration.lineThrough)), Text('${magazin.yaquBoxPrice} so\'m', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.accentGreen))]),
                        Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: AppColors.primaryBlue, borderRadius: BorderRadius.circular(6)), child: const Text('✓ YAQU BOX ARZON', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.primaryBlue),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [
                const CircleAvatar(radius: 30, backgroundColor: Colors.white, child: Icon(Icons.person, size: 40, color: AppColors.primaryBlue)),
                const SizedBox(height: 10),
                const Text('John Doe', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                const Text('+998 90 123 45 67', style: TextStyle(color: Colors.white70, fontSize: 12)),
              ]),
            ),
            ListTile(leading: const Icon(Icons.location_on, color: AppColors.primaryBlue), title: const Text('Lakatsiya'), subtitle: const Text('Tashkent, A. Street'), onTap: () {}),
            const Divider(),
            ListTile(leading: const Icon(Icons.history, color: AppColors.primaryBlue), title: const Text('Buyurtma Tarixi'), onTap: () {}),
            ListTile(leading: const Icon(Icons.qr_code_2, color: AppColors.primaryBlue), title: const Text('QR Scanner'), onTap: () => Navigator.pushNamed(context, '/qr-scanner')),
            ListTile(leading: const Icon(Icons.person, color: AppColors.primaryBlue), title: const Text('Profil'), onTap: () => Navigator.pushNamed(context, '/profile')),
            const Divider(),
            ListTile(leading: const Icon(Icons.logout, color: AppColors.accentRed), title: const Text('Chiqish', style: TextStyle(color: AppColors.accentRed)), onTap: () {}),
          ],
        ),
      ),
    );
  }
}
