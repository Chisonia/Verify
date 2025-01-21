import 'package:flutter/material.dart';
import 'package:verify/Screens/notification_screen.dart';
import 'package:verify/Screens/scan_screen.dart';
import '../Custom Widgets/history_card.dart';
import '../Custom Widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Store the selected index

  // Pages for each tab
  final List<Widget> _pages = [
    const HomeTab(),
    const ScanScreen(),
    const NotificationScreen(),
  ];

  // App bar titles
  final List<String> _appBarTitles = [
    '',
    'Scan',
    'Notifications',
  ];

  // Custom app bars for specific screens
  PreferredSizeWidget? _buildAppBar(int index) {
    if (index == 0) {
      // Home AppBar
      return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_avatar.png'),
            ),
            const SizedBox(width: 10),
            Text(
              'Welcome back Favour',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/icons/menu_icon-min.png'),
          ),
        ],
      );
    } else if (index == 1) {
      // Scan AppBar
      return AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/back_icon.png',
            width: 12.0,
            height: 24.0,
          ),
          onPressed: () {}, // Custom back arrow handler
        ),
        title: Text(
          _appBarTitles[index],
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      );
    } else if (index == 2) {
      // Notification AppBar
      return AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/back_icon.png',
            width: 12.0,
            height: 24.0,
          ),
          onPressed: () {}, // Custom back arrow handler
        ),
        title: Text(
          _appBarTitles[index],
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      );
    }
    return null;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index when a tab is tapped
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(_selectedIndex), // Display the appropriate app bar
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Set the selected index
        onTap: _onItemTapped, // Call this method when an item is tapped
        items: [
          _buildBottomNavigationBarItem(
            icon: 'assets/icons/home_icon.png',
            label: 'Home',
            isSelected: _selectedIndex == 0, // Check if it's selected
          ),
          _buildBottomNavigationBarItem(
            icon: 'assets/icons/scan_icon-min.png',
            label: 'Scan',
            isSelected: _selectedIndex == 1, // Check if it's selected
          ),
          _buildBottomNavigationBarItem(
            icon: 'assets/icons/notification_icon-min.png',
            label: 'Notification',
            isSelected: _selectedIndex == 2, // Check if it's selected
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String icon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF105341), // Green background
                borderRadius: BorderRadius.circular(80),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    icon,
                    color: Colors.white,
                  ),
                  Text(
                    label,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  color: Colors.grey,
                ),
                Text(
                  label,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
        ],
      ),
      label: '', // Suppress the default label
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for authentic products...',
                filled: true,
                fillColor: Colors.grey[100],
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Verification Card
            Container(
              height: 174,
              width: 352,
              decoration: BoxDecoration(
                color: const Color(0XFFFFF9E6),
                borderRadius: BorderRadius.circular(21.0),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 197,
                            child: Text(
                                'Don’t risk your health. Verify products today to ensure safety.',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                          const SizedBox(height: 4),
                          SizedBox(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Start Verifying',
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                        'assets/icons/solar_arrow.png'))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/images/shield.png',
                    height: 170,
                    width: 140,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Recommended Products
            Text(
              'Recommended products',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ProductCard(),
                  ProductCard(),
                  ProductCard(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Verification History
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Verification history',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            HistoryCard(
              title: 'Koflet',
              isVerified: false,
              subTitle: 'Himalaya Koflet Cough Syrup, 100 ml',
              subTitle1: 'January 7th, 2025.',
              subTitle2: 'Manual entry',
              subTitle3: '******',
              image: Image.asset('assets/images/koflet_image-min.png'),
            ),
            const SizedBox(height: 10),
            HistoryCard(
              title: 'Nivea',
              isVerified: true,
              subTitle:
              'Radiant & Beauty Advanced Care Lotion For Women - 400ml',
              subTitle1: 'January 4th, 2025.',
              subTitle2: 'Camera verification',
              subTitle3: '08 - 3486',
              image: Image.asset('assets/images/nivea_image-min.png'),
            ),
          ],
        ),
      ),
    );
  }
}
