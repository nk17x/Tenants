import 'package:flutter/material.dart';
import 'package:tenants_app/manageTenants.dart';
import 'package:tenants_app/receiveRent.dart';
import 'tenantsList.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

int bottomNavIndex = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 40,
            selectedItemColor: Color.fromARGB(218, 73, 181, 76),
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  label: "View Tenants",
                  icon: Icon(Icons.person_2_rounded)),
              BottomNavigationBarItem(
                label: "Manage Tenants",
                icon: Icon(Icons.person_add),
              ),
              BottomNavigationBarItem(
                  label: "Receive Rent", icon: Icon(Icons.currency_rupee))
            ],
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            currentIndex: bottomNavIndex,
            onTap: (value) {
              print(value);
              setState(() {
                bottomNavIndex = value;
              });
            },
          ),
          body: bottomNavIndex == 0
              ? tenantsList()
              : bottomNavIndex == 1
                  ? manageTenants()
                  : bottomNavIndex == 2
                      ? recieveRent()
                      : tenantsList()),
    );
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
