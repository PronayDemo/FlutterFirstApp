import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homepage_project/pages/HomePage.dart';
import 'package:homepage_project/pages/components/Sidebar.dart';
import 'package:homepage_project/pages/hoster-list.dart';
import 'package:homepage_project/pages/user/profile.dart';
import 'package:homepage_project/pages/user/wallet.dart';

const mainColor = Color.fromRGBO(255, 31, 104, 1.0);
const primaryColor = Color.fromRGBO(35, 38, 38, 1);
const secondaryColor = Color.fromRGBO(41, 45, 46, 1);
const pinkGradient = LinearGradient(
  colors: [Color.fromRGBO(228, 62, 229, 1), Color.fromRGBO(229, 15, 112, 1)],
);

class Transection extends StatefulWidget {
  const Transection({super.key});

  @override
  _TransectionPageState createState() => _TransectionPageState();
}

class _TransectionPageState extends State<Transection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    // Handle navigation logic
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Homepage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WalletPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HosterListPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transection History',
            style: TextStyle(color: mainColor)),
        centerTitle: true,
        elevation: 2.0,
        shadowColor: Colors.black,
        backgroundColor: const Color.fromRGBO(41, 45, 46, 1),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/icons/chevron-left.svg',
              color: Colors.white,
              height: 25,
              width: 25,
            ),
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: SvgPicture.asset(
                'assets/icons/menu.svg',
                color: Colors.white,
                height: 25,
                width: 25,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white, // Color of the selected tab text
          unselectedLabelColor: Colors.grey, // Color of the unselected tab text
          indicatorColor: mainColor, // Color of the indicator
          tabs: const [
            Tab(text: 'Transaction History'),
            Tab(text: 'Bet History'),
          ],
        ),
      ),
      drawer: const OffcanvasMenu(),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.black54,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_esports),
              label: 'Games',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle),
              label: 'Model',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
      backgroundColor: const Color.fromRGBO(35, 38, 38, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Transaction History Tab
                  ListView.builder(
                    itemCount: 10, // Example transaction count
                    itemBuilder: (context, index) {
                      return MouseRegion(
                        onEnter: (_) => setState(() {}),
                        onExit: (_) => setState(() {}),
                        child: Container(
                          color:
                              primaryColor, // Background color for each list item
                          margin: const EdgeInsets.symmetric(
                              vertical: 5.0), // Space between items
                          child: ListTile(
                            title: Text(
                              'Transaction #${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            subtitle: Text(
                              'Details of transaction #${index + 1}',
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                            trailing: Text(
                              '\$${(index + 1) * 100}',
                              style: const TextStyle(
                                color: mainColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  // Bet History Tab
                  ListView.builder(
                    itemCount: 10, // Example bet history count
                    itemBuilder: (context, index) {
                      return MouseRegion(
                        onEnter: (_) => setState(() {}),
                        onExit: (_) => setState(() {}),
                        child: Container(
                          color:
                              primaryColor, // Background color for each list item
                          margin: const EdgeInsets.symmetric(
                              vertical: 5.0), // Space between items
                          child: ListTile(
                            title: Text(
                              'Bet #${index + 1}',
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                            subtitle: Text(
                              'Details of bet #${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            trailing: Text(
                              '\$${(index + 1) * 50}', // Example amount
                              style: const TextStyle(
                                color: mainColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}