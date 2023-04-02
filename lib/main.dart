import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopy/Screen/BottomNav/bottom_navigation.dart';
import 'package:shopy/Screen/TabScreens/all.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopy',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Shopy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<FirebaseApp> _intialzationFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: FutureBuilder(
        future: _intialzationFirebase(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const Screen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      )),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<dynamic> users = [];
  String searchQuery = '';
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  void handleSearch(String query) {
  setState(() {
    searchQuery = query; // Update the searchQuery state variable
  });

  // Perform any additional search logic here
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                // showSearch(context: context, delegate: );
              },
              icon: const Icon(
                Icons.search_outlined,
                color: Colors.black,
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_bag,
                color: Colors.black,
                size: 30,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Categories",
                style: TextStyle(fontSize: 40, fontFamily: 'Pacifico'),
              ),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Colors.blue,
                labelColor: Colors.deepOrange,
                labelPadding: const EdgeInsets.only(right: 70),
                unselectedLabelColor: Colors.black,
                tabs:const [
                  Tab(
                    child: Text(
                      "All",
                      style: TextStyle(fontSize: 21, fontFamily: 'Roboto'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Mens",
                      style: TextStyle(fontSize: 21, fontFamily: 'Roboto'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Womens",
                      style: TextStyle(fontSize: 21, fontFamily: 'Roboto'),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Kids",
                      style: TextStyle(fontSize: 21, fontFamily: 'Roboto'),
                    ),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height - 50.0,
                width: double.infinity,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    All(),
                    All(),
                    All(),
                    All()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepOrange,
        child: IconButton(
          onPressed: () async {},
          icon: const Icon(Icons.shopping_cart),
        ),
      ),
      bottomNavigationBar: const BottomNavi(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
